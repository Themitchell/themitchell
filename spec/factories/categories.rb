# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  permalink  :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :category do
    sequence(:name) { |n| "test category #{n}" }
    permalink       { name.parameterize }
  end

end
