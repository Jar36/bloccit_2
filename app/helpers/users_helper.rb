module UsersHelper
  def has_posts?(post)
    @user.posts.any?
  end

  def has_comments?(user)
    @user.comments.any?
  end
  
  
  def has_favorites?(user)
    user.favorites.any?
  end
end
