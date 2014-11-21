require 'rails_helper'

feature 'Blog Pages', %q{
  In order to see the most relevant creative works
  As a reader
  I want the 5 most recent creative_works on the front page
} do

  scenario 'no creative works' do
    visit creative_works_path
    expect(page).to have_content('There are currently no creative works.')
  end

  scenario '1 creative work' do
    FactoryGirl.create(:creative_work,
      title: 'My Creative Work',
      description: 'This is my creative work.',
      published_at: '01-01-2010',
      tag_list: 'Apple, Ableton',
    )

    visit creative_works_path

    within 'ol' do
      within :xpath, 'li[1]' do
        expect(page).to have_content('My Creative Work')
        expect(page).to have_content('This is my creative work.')
        expect(page).to have_content('1 January 2010')

        click_link 'My Creative Work'
      end
    end

    expect(current_path).to eql('/creative-works/my-creative-work')

    expect(page).to have_content('My Creative Work')
    expect(page).to have_content('This is my creative work.')
    expect(page).to have_content('1 January 2010')
    expect(page).to have_content('Apple')
    expect(page).to have_content('Ableton')
  end

  scenario 'pagination on the Creative Works index' do
    creative_works = []
    6.times do |n|
      creative_work = FactoryGirl.create(:creative_work, published_at: 30.days.ago + n.days)
      creative_works <<  creative_work
    end
    old_creative_work = FactoryGirl.create(:creative_work, published_at: 2.years.ago)

    visit creative_works_path

    creative_works.each do |creative_work|
      expect(page).to have_content(creative_work.title)
    end
    expect(page).to_not have_content(old_creative_work.title)
  end
end
