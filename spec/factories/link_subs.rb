# == Schema Information
#
# Table name: link_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  link_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_sub do
    sub do
      user = FactoryGirl.create(:user)
      FactoryGirl.create(:sub, moderator: user)
    end
    link do
      FactoryGirl.create(:link)
    end
  end
end
