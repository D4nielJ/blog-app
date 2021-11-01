class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_likes
    counter = post.likes.count('id')
    post.update(likes_counter: counter)
  end
end
