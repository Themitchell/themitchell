require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:resource_class) { Post }

  it_behaves_like "an abstract displayable controller"

end
