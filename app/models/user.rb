class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  def recent_posts(quantity)
    posts.order(created_at: :desc).limit(quantity)
  end

  def recent_posts_3
    recent_posts(3)
  end
end
