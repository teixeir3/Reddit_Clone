# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
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
    it "should require a sub" do
      expect(FactoryGirl.build(:link, subs: [])).not_to be_valid
    end
    it "should require an author" do
      expect(FactoryGirl.build(:link, author: nil)).not_to be_valid
    end

    # implement later
    it "should be valid if given all good parameters"
  end

  it { should have_many(:subs) }

  it { should have_many(:link_subs)}

  it { should belong_to(:author) }
end
