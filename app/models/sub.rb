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

  has_many :links,
              class_name: "Link",
              foreign_key: :sub_id
end
