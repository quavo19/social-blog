require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Donald', posts_counter: 0) }
  let(:post) { user.posts.create(title: 'Post', comments_counter: 0, likes_counter: 0) }
  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is invalid with a negative posts_counter' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'is valid with a zero posts_counter' do
    user.posts_counter = 0
    expect(user).to be_valid
  end

  it 'returns the 3 most recent posts' do
    user.save!
    4.times { |i| user.posts.create(title: "Post #{i}", comments_counter: 0, likes_counter: 0) }
    expect(user.recent_posts.pluck(:title)).to eq(['Post 3', 'Post 2', 'Post 1'])
  end
end
