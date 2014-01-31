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

  has_many :comments,
    class_name: "Comment",
    foreign_key: :link_id,
    inverse_of: :link

    #returns a hash where each key(a parent_id) points to a value (an array of children)
    def comments_by_parent


      comments_by_parent = Hash.new { |hash, key| hash[key] = [] }

      comments.each do |comment|
        comments_by_parent[comment.parent_comment_id] << comment
      end

      comments_by_parent
      # comments = self.comments
 #      orphans = comments.select { |comment| comment.orphan? }
 #      {nil => orphans.map { |orphan| hashify(orphan) }}
    end

    def hashify(comment)

      if comment.childless?
        {comment => nil}
      else
        output = {}
        children = comment.child_comments


        output[comment] = children.map { |child| hashify(child) }


        output
      end
      # takes comment and returns a hash like {parent: {child, child, child}}
    end


end
