class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: { message: 'You cannot post an empty comment' }

  def update_post_comments
    counter = post.comments.count('id')
    post.update(comments_counter: counter)
  end

  def as_json(_options = {})
    super(except: %i[updated_at])
  end
end
