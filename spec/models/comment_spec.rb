require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_count' do
    let(:post) { Post.create(title: 'Test Post') }
    let(:author) { User.create(name: 'Test Author') }
    let(:comment) { Comment.create(body: 'Test Comment', post: post, author: author) }

    it 'updates the comments_counter attribute of the associated post' do
      expect { comment.send(:update_comments_count) }.to change { post.reload.comments_counter }.by(1)
    end
  end
end
