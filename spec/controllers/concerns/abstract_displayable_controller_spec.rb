RSpec.shared_examples_for 'an abstract displayable controller' do

  let!(:category1) { FactoryGirl.create(:category, name: 'X Alphabetically last') }
  let!(:category2) { FactoryGirl.create(:category, name: 'A Alphabetically first') }

  let(:resource_name) { resource_class.name.underscore }
  let!(:resource) {
    FactoryGirl.create(resource_name,
      title: '#{resource_class} 1',
      published_at: 1.week.ago,
      category: category1,
    )
  }

  describe 'GET "index"' do
    let!(:resource2) { FactoryGirl.create(resource_name, published_at: Time.current) }

    it 'assigns all of the resources ordered by published_at date' do
      get :index
      expect(assigns[resource_name.pluralize].first).to eq(resource2)
      expect(assigns[resource_name.pluralize].last).to eq(resource)
    end
  end

  describe 'GET "show"' do
    it 'assigns the correct resource' do
      get :show, id: resource.to_param
      expect(assigns[resource_name]).to eql(resource)
    end

    it 'assigns @categories with all categories sorted by name' do
      get :show, id: resource.to_param
      expect(assigns[:categories].first).to eq(category2)
      expect(assigns[:categories].last).to eq(category1)
    end
  end

end
