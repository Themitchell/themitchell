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

require 'rails_helper'

RSpec.describe Post, type: :model do

  context 'associations' do
    it { is_expected.to belong_to :category }
  end

  context 'validations' do
    context 'presence' do
      it { is_expected.to     validate_presence_of    :title }
      it { is_expected.to_not allow_value("").for     :title }
      it { is_expected.to     validate_presence_of    :body }
      it { is_expected.to_not allow_value("").for     :body }
      it { is_expected.to     validate_presence_of    :summary }
      it { is_expected.to_not allow_value("").for     :summary }
      it { is_expected.to     validate_presence_of    :category }
    end

    context 'uniqueness' do
      before { FactoryGirl.create(:post) }

      it { is_expected.to     validate_uniqueness_of  :title }
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
