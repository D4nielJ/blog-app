class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def recent_posts(quantity)
    posts.order(created_at: :desc).limit(quantity)
  end

  def three_recent_posts
    recent_posts(3)
  end

  def update_post_comments
    counter = post.comments.count('id')
    post.update(comments_counter: counter)
  end
end
