class CreativeWorksController < ApplicationController

  include AbstractDisplayableController

private

  def klass
    CreativeWork
  end

end
