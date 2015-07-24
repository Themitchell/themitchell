require 'redcarpet'

class PostPresenter

  def initialize(post:)
    @post = post
  end

  delegate  :to_partial_path,
            :to_param,
            to: :post

  delegate  :title,
            :published_at,
            :summary,
            :tags,
            to: :post

  def summary
    markdown_renderer.render(post.summary).html_safe
  end

  def body
    markdown_renderer.render(post.body).html_safe
  end

private
  attr_reader :post

  def markdown_renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, filter_html: true)
  end
end
