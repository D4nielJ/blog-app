require 'rails_helper'

RSpec.describe 'the signin process', type: :feature do
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

  it 'fails to sign with no user or password' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it 'fails to sign with incorrect password' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'aragorn@user.com'
      fill_in 'user_password', with: 'anotherpassword'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end

  it 'signs me in' do
    visit '/users/sign_in'
    within('#new_user') do
      fill_in 'user_email', with: 'aragorn@user.com'
      fill_in 'user_password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
