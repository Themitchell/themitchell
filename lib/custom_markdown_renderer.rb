require 'redcarpet'

class CustomMarkdownRenderer < Redcarpet::Render::HTML
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::AssetTagHelper

  def parse_media_link(link)
    model_regex = '(\w+)'
    id_regex = '([-\w\d\.]+)'
    size_regex = '(\w+)'
    css_class_regex = '([-\w\s\d]+)'

    matches = link.match(/^#{model_regex} ?(?:\| ?#{id_regex}) ?(?:\| ?#{size_regex})? ?(?:\|#{css_class_regex})?$/)
    {
        model: matches[1],
        id: matches[2],
        size_x1: "#{(matches[3] || 'original')}_x1".to_sym,
        size_x2: "#{(matches[3] || 'original')}_x2".to_sym,
        class: matches[4]

    } if matches
  end

  def image(link, title, alt_text)
    size = nil
    klass = nil

    if nil != (parse = parse_media_link(link))
      media = parse[:model].constantize.where(id: parse[:id]).first ||
              parse[:model].constantize.where(name: parse[:id]).first
      if media
        link = media.file.url(parse[:size_x1])
        link_x2 = media.file.url(parse[:size_x2])
        klass = parse[:class]
      end
    end

    image_tag(link, :title => title, :alt => alt_text, :class => klass)
  end

  def link(link, title, content)
    klass = nil
    if nil != (parse = parse_media_link(link))
      media = Media.find_by_id(parse[:id]) || Media.find_by_name(parse[:id])
      if media
        link = media.file.url(parse[:size])
        klass = parse[:class]
      end
    end

    link_to(content, link, :title => title, :class => klass)
  end
end
