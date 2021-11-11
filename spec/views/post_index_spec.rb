RSpec.describe 'Index page', type: :feature do
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
    @post1 = Post.create(title: 'article 1', text: 'My text', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(title: 'article 2', text: 'My text', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(title: 'article 3', text: 'My text', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)
    @post4 = Post.create(title: 'article 4', text: 'My text', author_id: @user.id, comments_counter: 0,
                         likes_counter: 0)

    @comment1 = Comment.create(text: 'My comment', author_id: @user.id, post_id: @post2.id)
  end

  describe 'index page' do
    it 'shows the right content' do
      visit user_posts_path(@user)
      assert_current_path("/users/#{@user.id}/posts")
      expect(page).to have_xpath("//img[contains(@src, #{@user.photo_link})]")
      expect(page).to have_content('Aragorn II Elessar')
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content('Likes: 0')
      expect(page).to have_content('Load more...')
    end

    it 'redirects to the correct post' do
      visit user_posts_path(@user)
      click_on 'Load more'
      click_on @post4.title
      assert_current_path(user_post_path(@user, @post4))
    end
  end
end
