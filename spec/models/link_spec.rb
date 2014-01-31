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

  it "should produce a nice hash of its comments" do
    link = FactoryGirl.create(:link)
    a = FactoryGirl.create(:comment, link: link)
    b = FactoryGirl.create(:comment, link: link)
    c = FactoryGirl.create(:comment, link: link)
    d = FactoryGirl.create(:comment, link: link, parent_comment: a)
    e = FactoryGirl.create(:comment, link: link, parent_comment: a)
    f = FactoryGirl.create(:comment, link: link, parent_comment: c)
    g = FactoryGirl.create(:comment, link: link, parent_comment: d)
    h = FactoryGirl.create(:comment, link: link, parent_comment: e)
    i = FactoryGirl.create(:comment, link: link, parent_comment: e)

    expect(link.comments_by_parent_id).to eq(
      {nil => [{a => [{d => [{g => nil}]}, {e => [{h => nil}, {i => nil}]}] },
       {b => nil}, {c => [{f => nil} ] } ] }  )

       # {nil => [1,2,3], 1 => [4]}
  end
end
