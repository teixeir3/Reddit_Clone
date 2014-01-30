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

class Link < ActiveRecord::Base
  attr_accessible :title, :text, :url, :sub_ids, :subs

  validates :title, :url, :subs,:author, presence: true

  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id

  has_many :link_subs,
    class_name: "LinkSub",
    foreign_key: :link_id,
    inverse_of: :link

  has_many :subs, through: :link_subs, source: :sub, inverse_of: :links

end
