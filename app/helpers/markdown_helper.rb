require 'redcarpet'
require 'custom_markdown_renderer'

module MarkdownHelper
  def render_markdown(markdown)
    @@markdown ||= Redcarpet::Markdown.new(CustomMarkdownRenderer, autolink: true)
    @@markdown.render(markdown).html_safe
  end
end
