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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    title do
      Faker::Company.catch_phrase
    end
    author do
      FactoryGirl.build(:user)
    end
    url do
      Faker::Internet.url
    end
    text do
      Faker::Lorem.paragraph
    end
    subs do
      [FactoryGirl.build(:sub)]
    end
  end
end
