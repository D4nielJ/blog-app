class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true

  def recent_posts(quantity)
    posts.order(created_at: :desc).limit(quantity)
  end

  def three_recent_posts
    recent_posts(3)
  end

  def photo_link
    photo == '' ? 'no_picture.jpg' : photo
  end
end
