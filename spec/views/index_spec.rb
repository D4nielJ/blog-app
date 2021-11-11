require 'rails_helper'

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
  end

  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('BLOG ON RAILS')
      expect(page).to have_content('Aragorn II Elessar')
      expect(page).to have_xpath("//img[contains(@src, #{@user.photo_link})]")
      expect(page).to have_content('Number of posts: 0')
      click_on 'Aragorn II Elessar'
      assert_current_path("/users/#{@user.id}")
    end
  end
end
