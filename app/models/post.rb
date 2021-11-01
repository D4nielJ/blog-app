class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_author_posts
    counter = author.posts.count('id')
    author.update(posts_counter: counter)
  end

  def recent_comments(quantity)
    comments.order(created_at: :desc).limit(quantity)
  end

  def recent_comments_5
    recent_comments(5)
  end
end
