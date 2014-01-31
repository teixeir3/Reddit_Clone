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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sub do
    name do
      Faker::Company.catch_phrase
    end
    moderator do
      FactoryGirl.create(:user)
    end
  end
end
