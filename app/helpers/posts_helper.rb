module PostsHelper
  def post_comments
    @post.comments.includes(:user)
  end
end
