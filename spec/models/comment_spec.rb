require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Donald', posts_counter: 0) }
  let(:post) { user.posts.create(title: 'My Post', comments_counter: 0, likes_counter: 0) }
  let(:comment) { post.comments.create(author_id: user.id) }

  it 'increase the number of comments after a comment' do
    expect { comment.save! }.to change { post.reload.comments_counter }.from(0).to(1)
  end
end
