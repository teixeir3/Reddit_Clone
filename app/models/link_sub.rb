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

class LinkSub < ActiveRecord::Base
  attr_accessible :sub_id, :link_id, :sub, :link

  validates :sub, :link, presence: true
  validates :sub_id, uniqueness: { scope: :link_id }

  belongs_to :sub,
    class_name: "Sub",
    foreign_key: :sub_id,
    inverse_of: :link_subs

  belongs_to :link,
    class_name: "Link",
    foreign_key: :link_id,
    inverse_of: :link_subs
end
