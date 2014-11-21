class CvController < ApplicationController

  def index
    @projects = Project.all
  end
end
