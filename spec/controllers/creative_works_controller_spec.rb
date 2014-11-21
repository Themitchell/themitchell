require 'rails_helper'

RSpec.describe CreativeWorksController, type: :controller do

  let(:resource_class) { CreativeWork }

  it_behaves_like "an abstract displayable controller"

end
