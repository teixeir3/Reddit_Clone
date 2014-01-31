module LinksHelper
  # We don't use these.
=begin
  def display_comments(comments_hash)
    comments_hash[nil].each do |child_comment|
      display_comments_helper(child_comment)
    end
  end

  def display_comments_helper(comments_hash)
    @parent_comment = comments_hash.keys.first
    render: @parent_comment # what about base_case parent_comment = nil
    if comments_hash[@parent_comment].nil?
      nil
    else
      comments_hash[@parent_comment].each do |child_comment|
        display_comments_helper(child_comment)
      end
    end
  end
=end
end
