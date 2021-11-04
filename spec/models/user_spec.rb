require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Tom Bombadill',
                photo: 'link',
                bio: 'Old Tom Bombadil is a merry fellow! Bright Blue his jacket is, and his boots are yellow!',
                posts_counter: 0)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
