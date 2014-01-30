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

class Link < ActiveRecord::Base
  attr_accessible :title, :text, :url

  validates :title, :url, :sub, :author, presence: true

  belongs_to :sub

  belongs_to :author,
  class_name: "User",
  foreign_key: :author_id

  belongs_to :moderator,
  through: :sub,
  source: :moderator
end
