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

require 'rails_helper'

RSpec.describe Category, type: :model do

  context 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:creative_works) }
  end

  context 'validations' do
    context 'presence' do
      it { is_expected.to     validate_presence_of    :name }
      it { is_expected.to_not allow_value("").for     :name }
    end

    context 'uniqueness' do
      before { FactoryGirl.create(:category) }

      it { is_expected.to validate_uniqueness_of  :permalink }
    end
  end

  describe "permalink field" do
    it "should set the permalink based on the title" do
      p = FactoryGirl.create(:post, title: "Test Title")
      expect(p.permalink).to eql("test-title")
    end

    it "to_param should return the permalink" do
      p = FactoryGirl.create(:post, title: "Test Title")
      expect(p.to_param).to eql(p.permalink)
    end
  end

end
