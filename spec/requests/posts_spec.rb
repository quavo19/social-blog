require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    user = User.create(name: 'Akite donald', posts_counter: 0)
    post = user.posts.create(title: 'Post 1', comments_counter: 0, likes_counter: 0)
    user.save!
    post.author_id = user.id
    post.save!
  end
  describe 'GET /users/:id/posts' do
    let(:user) { User.create(name: 'Akite donald', posts_counter: 0) }
    let(:post) { Post.create(title: 'Post 1', comments_counter: 0, likes_counter: 0) }
    it 'has a 200 status code' do
      get '/', params: { user_id: user.id }
      expect(response).to have_http_status(200)
    end
    it 'renders the right template for Posts' do
      get '/', params: { user_id: user.id }
      expect(response.body).to render_template(:index)
    end
  end
  describe 'GET /show' do
    let(:user) { User.create(name: 'Akite Donald', posts_counter: 0) }
    let(:post) { user.posts.create(title: 'Post 1', comments_counter: 0, likes_counter: 0) }
    it 'returns a success response' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template('show')
    end

    it 'response body includes the correct content' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to match(%r{<h1>show a specific post</h1>})
    end
  end
end
