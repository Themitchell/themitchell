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

class Post < ActiveRecord::Base
  include Displayable
  include Permalinkable
  include Taggable
  include Paginatable
  include Publishable

  # Associations
  belongs_to :category

  # Validations
  validates :title,         presence: true, uniqueness: true
  validates :body,          presence: true
  validates :summary,       presence: true
  validates :category,      presence: true

end
