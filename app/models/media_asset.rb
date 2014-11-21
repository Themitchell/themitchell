# == Schema Information
#
# Table name: media_assets
#
#  id         :integer          not null, primary key
#  file       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class MediaAsset < ActiveRecord::Base

  # Validations
  validates :file, presence: true

end
