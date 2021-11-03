class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_comments
    counter = post.comments.count('id')
    post.update(comments_counter: counter)
  end
end
