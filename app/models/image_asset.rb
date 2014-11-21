# == Schema Information
#
# Table name: image_assets
#
#  id         :integer          not null, primary key
#  file       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class ImageAsset < ActiveRecord::Base

  # Behaviours
  mount_uploader :file, ImageUploader

  # Validations
  validates :file, presence: true

end
