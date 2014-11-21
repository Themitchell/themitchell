# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do


  before { FactoryGirl.create(:user) }

  it { is_expected.to     validate_presence_of    :password }
  it { is_expected.to_not allow_value("").for     :password }
  it { is_expected.to     validate_uniqueness_of  :email    }

end
