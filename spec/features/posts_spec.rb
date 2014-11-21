require 'rails_helper'

feature 'Blog Pages', %q{
  In order to see the most relevant posts
  As a reader
  I want the 5 most recent posts on the front page
} do

  scenario 'no posts' do
    visit posts_path
    expect(page).to have_content('There are currently no posts.')
  end

  scenario '1 post' do
    post = FactoryGirl.create(:post,
      title: 'My Post',
      body: 'This is my post.',
      published_at: '01-01-2010',
      tag_list: 'Apple, Ableton',
    )
    visit posts_path

    within 'ol' do
      within :xpath, 'li[1]' do
        expect(page).to have_content('My Post')
        expect(page).to have_content('This is my post.')
        expect(page).to have_content('1 January 2010')

        click_link 'My Post'
      end
    end

    expect(current_path).to eql('/posts/my-post')

    expect(page).to have_content('My Post')
    expect(page).to have_content('This is my post.')
    expect(page).to have_content('1 January 2010')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Ableton')
  end

  scenario 'pagination on the posts index' do
    posts = []
    6.times do |n|
      post = FactoryGirl.create(:post, published_at: 30.days.ago + n.days)
      posts <<  post
    end
    old_post = FactoryGirl.create(:post, published_at: 2.years.ago)

    visit posts_path

    posts.each do |post|
      expect(page).to have_content(post.title)
    end
    expect(page).to_not have_content(old_post.title)
  end
end
