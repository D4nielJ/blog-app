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
  end

  describe 'index page' do
    it 'shows the right content' do
      visit user_path(@user)
      expect(page).to have_content('Aragorn II Elessar')
      expect(page).to have_xpath("//img[contains(@src, #{@user.photo_link})]")
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('I am Aragorn son of Arathorn, and am called Elessar')
      expect(page).to_not have_content(@post1.title)
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post3.title)
      expect(page).to have_content(@post4.title)
      expect(page).to have_content('See all posts')
      assert_current_path("/users/#{@user.id}")
    end

    it 'redirects to the correct post' do
      visit user_path(@user)
      click_on @post4.title
      assert_current_path(user_post_path(@user, @post4))
    end

    it 'redirects to all posts' do
      visit user_path(@user)
      click_on 'See all posts'
      assert_current_path(user_posts_path(@user))
    end
  end
end
