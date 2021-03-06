require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @user = User.new(name: 'Aragorn II Elessar',
                     email: 'aragorn@user.com',
                     bio: "I am Aragorn son of Arathorn, and am called Elessar,\s
                      the Elfstone, Dúnadan, the heir of Isildur Elendil's son of Gondor.\s
                      Here is the sword that was broken and is forged again!",
                     password: 'password',
                     password_confirmation: 'password',
                     posts_counter: 0)
    @user.skip_confirmation!
    @user.save!
    @post = Post.create(title: 'My title', text: 'My text', author_id: @user.id, comments_counter: 0, likes_counter: 0)
  end

  describe 'GET /index' do
    before { get user_posts_path(@user) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'body has the correct text' do
      expect(response.body).to include('My title')
    end
  end

  describe 'GET users/index/posts/1' do
    before { get user_post_path(@user, @post) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'body has the correct text' do
      expect(response.body).to include('My text')
    end
  end
end
