require 'redcarpet'

module MarkdownHelper

  def render_markdown(markdown)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true).render(markdown).html_safe
  end

end
