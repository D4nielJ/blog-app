class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Roles = %i[admin default]

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true

  ## Custom

  def recent_posts(quantity)
    posts.order(created_at: :desc).limit(quantity)
  end

  def three_recent_posts
    recent_posts(3)
  end

  def photo_link
    photo == '' ? 'no_picture.jpg' : photo
  end

  def is?(requested_role)
    role == requested_role.to_s
  end

  ## Extending as_json method

  def as_json(_options = {})
    super(only: %i[id name bio posts_counter])
  end
end
