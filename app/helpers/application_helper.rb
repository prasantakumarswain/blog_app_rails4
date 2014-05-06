module ApplicationHelper
  def username(id)
    user=User.find(id)
    user.username
  end
  def comments(blog)
    blog.comments
  end
end
