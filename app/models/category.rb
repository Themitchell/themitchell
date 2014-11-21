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

class Category < ActiveRecord::Base
  include Displayable
  include Permalinkable

  # Associations
  has_many :creative_works
  has_many :posts

  # Validations
  validates :name, presence: true, uniqueness: true
end
