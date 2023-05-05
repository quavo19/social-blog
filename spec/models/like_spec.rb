require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'callbacks' do
    describe 'after_save' do
      it 'updates the likes_counter of the associated post' do
        user = User.create(name: 'Akite', posts_counter: 0)
        post = user.posts.create(title: 'Post 1', comments_counter: 0, likes_counter: 0)
        post.likes.create(author_id: user.id)

        expect(post.reload.likes_counter).to eq(1)
      end
    end
  end
end
