class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  def recent_posts(quantity)
    posts.order(created_at: :desc).limit(quantity)
  end

  def three_recent_posts
    recent_posts(3)
  end
end
