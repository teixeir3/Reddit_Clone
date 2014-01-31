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

class Comment < ActiveRecord::Base
  attr_accessible :body, :link, :parent_comment, :author, :parent_id, :parent_comment_id

  validates :body, :link, :author, presence: true

  has_many :child_comments,
    class_name: "Comment",
    foreign_key: :parent_comment_id,
    inverse_of: :parent_comment

  belongs_to :parent_comment,
    class_name: "Comment",
    foreign_key: :parent_comment_id,
    inverse_of: :child_comments

  belongs_to :link,
    class_name: "Link",
    foreign_key: :link_id,
    inverse_of: :comments

  belongs_to :author,
    class_name: "User",
    foreign_key: :user_id,
    inverse_of: :comments


  def find_root
    if parent_comment
      parent_comment.find_root
    else
      self
    end
  end

  def childless?
    self.child_comments.empty?
  end

  def orphan?
    self.parent_comment.nil?
  end
end
