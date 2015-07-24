class PostPresenter
  include MarkdownHelper

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
    render_markdown(post.summary).html_safe
  end

  def body
    render_markdown(post.body).html_safe
  end

private
  attr_reader :post
end
