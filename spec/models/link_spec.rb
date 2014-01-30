# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  title      :string(255)      not null
#  url        :string(255)      not null
#  author_id  :integer          not null
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Link do

  describe "has correct attributes" do
    it "should require a title" do
      expect(FactoryGirl.build(:link, title: nil)).not_to be_valid
    end
    it "should require a url" do
      expect(FactoryGirl.build(:link, url: nil)).not_to be_valid
    end
    it "should require a sub_id" do
      expect(FactoryGirl.build(:link, sub_id: nil)).not_to be_valid
    end
    it "should require an author_id" do
      expect(FactoryGirl.build(:link, author_id: nil)).not_to be_valid
    end
  end

  it { should belong_to(:sub) }
  it { should have_one(:moderator) }
  it { should belong_to(:author) }
end
