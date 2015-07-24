class PostsController < ApplicationController

  def index
    @category = Category.where(permalink: params[:category]).first
    @posts = Kaminari.paginate_array(
      Post.order('published_at DESC').page(params[:page]).map { |p| PostPresenter.new(post: p) }
    ).page(params[:page])
  end

  def show
    @post = PostPresenter.new(post: Post.where(permalink: params[:id]).first)
  end

end
