class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper :all

  before_filter :assign_categories

  def filtered_posts_path
    posts_path(params[:category], params[:tag])
  end

private

  def assign_categories
    @categories ||= Category.order('name ASC')
  end

end
