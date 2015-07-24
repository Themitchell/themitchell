require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let!(:category1) { FactoryGirl.create(:category, name: 'X Alphabetically last') }
  let!(:category2) { FactoryGirl.create(:category, name: 'A Alphabetically first') }

  let(:post_published_at) { 1.week.ago }
  let!(:post) {
    FactoryGirl.create(:post,
      published_at: post_published_at,
      category: category1,
    )
  }

  describe 'GET "index"' do
    let(:post2_published_at) { Time.current }
    let!(:post2) {
      FactoryGirl.create(:post, published_at: post2_published_at)
    }

    it 'assigns all of the posts ordered by published_at' do
      get :index
      expect(assigns[:posts].first.published_at).to eq(post2_published_at)
      expect(assigns[:posts].last.published_at).to eq(post_published_at)
    end

    it 'assigns all of the posts wrapped in a presenter' do
      get :index
      expect(assigns[:posts].first).to be_a(PostPresenter)
      expect(assigns[:posts].last).to be_a(PostPresenter)
    end
  end

  describe 'GET "show"' do
    it 'assigns the correct post' do
      get :show, id: post.to_param
      expect(assigns[:post].to_param).to eql(post.to_param)
    end

    it 'wraps the post in a presenter' do
      get :show, id: post.to_param
      expect(assigns[:post]).to be_a(PostPresenter)
    end

    it 'assigns @categories with all categories sorted by name' do
      get :show, id: post.to_param
      expect(assigns[:categories].first).to eq(category2)
      expect(assigns[:categories].last).to eq(category1)
    end
  end

end
