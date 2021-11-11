require 'rails_helper'

RSpec.describe 'Index page', type: :feature do
  describe 'index page' do
    it 'shows the right content' do
      visit users_path
      expect(page).to have_content('BLOG ON RAILS')
    end
  end
end
