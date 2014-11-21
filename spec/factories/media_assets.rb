# == Schema Information
#
# Table name: media_assets
#
#  id         :integer          not null, primary key
#  file       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :media_asset do
  end
end
