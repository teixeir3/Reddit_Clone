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

class Sub < ActiveRecord::Base
  attr_accessible :name, :moderator_id

  validates :name, :moderator_id, presence: true
  validates :name, uniqueness: true

  belongs_to :moderator,
              class_name: "User",
              foreign_key: :moderator_id

  has_many :link_subs,
            class_name: "LinkSub",
            foreign_key: :sub_id,
            inverse_of: :sub

  has_many :links,
            through: :link_subs,
            source: :link,
            inverse_of: :subs
end
