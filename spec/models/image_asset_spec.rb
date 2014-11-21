# == Schema Information
#
# Table name: image_assets
#
#  id         :integer          not null, primary key
#  file       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe ImageAsset, type: :model do

  context 'validations' do
    context 'presence' do
      it { is_expected.to     validate_presence_of :file }
      it { is_expected.to_not allow_value("").for  :file }
    end
  end

end
