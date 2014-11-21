class PostsController < ApplicationController

  include AbstractDisplayableController

private

  def klass
    Post
  end

end
