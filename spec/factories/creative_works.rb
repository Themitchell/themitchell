# == Schema Information
#
# Table name: creative_works
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  permalink    :string(255)      not null
#  description  :text
#  published_at :datetime
#  category_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :creative_work do
    sequence(:title)          { |n| "test creative work #{n}" }
    permalink                 { title.parameterize }
    description               'This is a factory generated creative work description'
    sequence(:published_at)   { |n| n.minutes.from_now }
    association :category,    factory: :category
  end

end
