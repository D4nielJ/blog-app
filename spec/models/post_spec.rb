# require 'rails_helper'

# RSpec.describe Post, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Aragorn II Elessar',
                        photo: 'link',
                        bio: "I am Aragorn son of Arathorn, and am called Elessar,\s
                        the Elfstone, Dúnadan, the heir of Isildur Elendil's son of Gondor.\s
                        Here is the sword that was broken and is forged again!",
                        posts_counter: 0)
    @post = Post.new(title: 'My title', text: 'My text', author_id: @user.id, comments_counter: 0, likes_counter: 0)
    @post.save
  end

  it 'title should be present' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'should be not valid when comments_counter not number' do
    @post.comments_counter = nil
    expect(@post).to_not be_valid
  end

  it 'should be not valid when comments_counter negative' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'should be not valid when likes_counter not number' do
    @post.likes_counter = nil
    expect(@post).to_not be_valid
  end

  it 'should be not valid when likes_counter negative' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end
end
