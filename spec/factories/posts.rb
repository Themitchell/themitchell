# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  permalink    :string(255)      not null
#  body         :text
#  published_at :date
#  category_id  :integer          not null
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :post do
    sequence(:title)          { |n| "test post #{n}" }
    permalink                 { title.parameterize }
    body                      'This is a factory generated post body'
    sequence(:published_at)   { |n| n.minutes.from_now }
    association :category,    factory: :category
  end

end
