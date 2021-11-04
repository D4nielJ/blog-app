require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Aragorn II Elessar',
                photo: 'link',
                bio: "I am Aragorn son of Arathorn, and am called Elessar,\s
                the Elfstone, Dúnadan, the heir of Isildur Elendil's son of Gondor.\s
                Here is the sword that was broken and is forged again!",
                posts_counter: 0)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
