# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Sub do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:user1) {User.create!({username: "username",
                              password: "password"})}

  it "has a name" do
    expect(FactoryGirl.build(:sub, name: nil)).not_to be_valid
  end

  it "has a moderator" do
    expect(FactoryGirl.build(:sub, moderator: nil)).not_to be_valid
  end

  it { should belong_to(:moderator) }

  it { should have_many(:links) }

  it { should have_many(:link_subs)}

end
