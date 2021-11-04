require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    @user = User.create(name: 'Aragorn II Elessar',
                       photo: 'link',
                       bio: "I am Aragorn son of Arathorn, and am called Elessar,\s
                       the Elfstone, Dúnadan, the heir of Isildur Elendil's son of Gondor.\s
                       Here is the sword that was broken and is forged again!",
                       posts_counter: 0)
  end

  describe 'GET /index' do
    before { get '/users' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'body has the correct text' do
      expect(response.body).to include('BLOG ON RAILS')
    end
  end

  describe 'GET /index/id' do
    before { get user_path(@user) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'body has the correct text' do
      expect(response.body).to include('About...')
    end
  end
end
