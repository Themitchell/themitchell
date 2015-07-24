require 'redcarpet'

class CustomMarkdownRenderer < Redcarpet::Render::HTML
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper
  include RetinaImageHelper

  def parse_media_link(link)
    model_regex = '(\w+)'
    id_regex = '([-\w\d\.]+)'
    size_regex = '(\w+)'
    css_class_regex = '([-\w\s\d]+)'

    matches = link.match(/^#{model_regex} ?(?:\| ?#{id_regex}) ?(?:\| ?#{size_regex})? ?(?:\|#{css_class_regex})?$/)
    {
        model: matches[1],
        id: matches[2],
        size: (matches[3] || 'original'),
        class: matches[4]

    } if matches
  end

  def image(link, title, alt_text)
    options = {
      title: title,
      alt: alt_text
    }

    if nil != (parse = parse_media_link(link))
      if media = find_media(parse[:model], parse[:id])
        link = media.file.url("#{parse[:size]}_1x".to_sym)
        options[:class] = parse[:class]
      end
    end

    retina_image_tag(link, options)
  end

  def link(link, title, content)
    klass = nil
    if nil != (parse = parse_media_link(link))
      if media = find_media(parse[:model], parse[:id])
        link = media.file.url(parse[:size])
        klass = parse[:class]
      end
    end

    link_to(content, link, title: title, class: klass)
  end

private
  def find_media(model, finder_param)
    model.constantize.where(id: finder_param).first ||
    model.constantize.where(name: finder_param).first ||
    model.constantize.where(title: finder_param).first
  end
end
