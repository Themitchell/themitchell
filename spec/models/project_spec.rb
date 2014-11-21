require 'rails_helper'

RSpec.describe Project, :type => :model do

  context 'validations' do
    context 'presence' do
      it { is_expected.to     validate_presence_of :name }
      it { is_expected.to_not allow_value("").for  :name }
    end
  end

end
