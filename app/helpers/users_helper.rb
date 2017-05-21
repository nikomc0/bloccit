module UsersHelper
  def user_contributions_for_posts?
    @user.posts.any?
  end

  def user_contributions_for_comments?
    @user.comments.any?
  end

end
