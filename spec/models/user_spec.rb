require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(name: 'Aragorn II Elessar',
                     photo: 'link',
                     bio: "I am Aragorn son of Arathorn, and am called Elessar,\s
                     the Elfstone, Dúnadan, the heir of Isildur Elendil's son of Gondor.\s
                     Here is the sword that was broken and is forged again!",
                     posts_counter: 0)
    @user.save
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should return not valid with no number value for posts_counter' do
    @user.posts_counter = nil
    expect(@user).to_not be_valid
  end

  it 'should return not valid with negative number' do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end
end
