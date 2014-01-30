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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    sub_id do
      1
    end
    title do
      Faker::Company.catch_phrase
    end
    author_id do
      1
    end
    url do
      Faker::Internet.url
    end
    text do
      Faker::Lorem.paragraph
    end
  end
end
