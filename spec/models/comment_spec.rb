# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  parent_comment_id :integer
#  link_id           :integer          not null
#  user_id           :integer          not null
#  body              :text             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'spec_helper'

describe Comment do
  describe "validations" do
    it "should require a link" do
      expect(FactoryGirl.build(:comment, link: nil)).to_not be_valid
    end

    it "should require an author" do
      expect(FactoryGirl.build(:comment, author: nil)).to_not be_valid
    end

    it "should require a body" do
      expect(FactoryGirl.build(:comment, body: nil)).to_not be_valid
    end

    it "should work fine if everythings okay" do
      expect(FactoryGirl.create(:comment)).to be_valid
    end

    it "should nest" do
      parent_comment = (FactoryGirl.create(:comment))

      expect(FactoryGirl.build(:comment, parent_comment: parent_comment)).to be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:parent_comment) }
    it { should have_many(:child_comments) }
    it { should belong_to(:author) }
    it { should belong_to(:link) }
  end

  describe "#find_root" do
    it "should find the root comment" do
      parent_comment = (FactoryGirl.create(:comment))

      second_comment = FactoryGirl.build(:comment, parent_comment: parent_comment)

      third_comment = FactoryGirl.build(:comment, parent_comment: second_comment)

      expect(third_comment.find_root.id).to eq(parent_comment.id)
    end
  end
end
