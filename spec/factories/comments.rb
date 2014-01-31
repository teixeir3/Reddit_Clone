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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    parent_comment nil
    link do
      FactoryGirl.create(:link)
    end
    author do
      FactoryGirl.create(:user)
    end
    body do
      Faker::Lorem.paragraph
    end
  end
end
