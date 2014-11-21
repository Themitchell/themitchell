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

class CreativeWork < ActiveRecord::Base
  include Displayable
  include Permalinkable
  include Taggable
  include Paginatable

  # Associations
  belongs_to :category

  # Validations
  validates :title,       presence: true, uniqueness: true
  validates :description, presence: true
  validates :category,    presence: true

end
