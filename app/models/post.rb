class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: { message: 'Title cannot be blank' }
  validates :title, length: { maximum: 250, too_long: '250 characters is the maximum allowed for the title' }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  # Custom

  def update_author_posts
    counter = author.posts.count('id')
    author.update(posts_counter: counter)
  end

  def recent_comments(quantity)
    comments.order(created_at: :asc).limit(quantity).includes(:author)
  end

  def five_recent_comments
    recent_comments(5)
  end

  ## Extending as_json method

  def as_json(_options = {})
    super(only: %i[id title text comments_counter likes_counter], include: :comments)
  end

  # Pretty examples -->
  # super(only: %i[id title text comments_counter likes_counter], include: { author: { only: %i[id name] } })

  # super(only: %i[id title text comments_counter
  #   likes_counter], include: [:comments, { author: { only: %i[id name] } }])
end
