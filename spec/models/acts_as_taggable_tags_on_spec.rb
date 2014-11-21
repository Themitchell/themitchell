# == Schema Information
#
# Table name: creative_works
#
#  id           :integer          not null, primary key
#  title        :string(255)      not null
#  description  :text
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

require 'rails_helper'

RSpec.describe ActsAsTaggableOn::Tag, type: :model do

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
