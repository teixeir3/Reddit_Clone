# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  token           :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  let!(:user1) {User.create!({username: "username",
                              password: "password"})}

  it "validates password length" do
    expect(FactoryGirl.build(:user, password: "")).not_to be_valid
  end

  it "validates accepts a 6+ char password" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "finds a user by username and password" do
    expect(User.find_by_credentials("username", "password")).not_to be_nil
  end

  it "returns nil if given incorrect credentials" do
    expect(User.find_by_credentials("username", "poop")).to be_nil
  end

  it "doesn't store the password in db" do
    user1 = User.find_by_credentials("username", "password")
    expect(user1.password).to be_nil
  end

  it { should have_many(:subs) }

  it { should have_many(:links) }

end
