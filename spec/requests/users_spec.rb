require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before :each do
    user = User.create(name: 'Akite Donald', posts_counter: 0)
    post = user.posts.create(title: 'Post 1', comments_counter: 0, likes_counter: 0)
    post.author_id = user.id
    post.save!
  end
  describe 'GET /users' do
    it 'works! test root' do
      get '/users'
      expect(response).to have_http_status(200)
    end
    it 'renders the correct template' do
      get '/users'
      expect(response).to render_template('index')
    end
  end
  describe 'GET /users/:id' do
    let(:user) { User.create(name: 'Akite Donald', posts_counter: 0) }
    it 'has 200 status code' do
      get '/users', params: { id: user.id }
      expect(response).to have_http_status(200)
    end
    it 'renders the right template' do
      get '/users', params: { id: user.id }
      expect(response).to render_template('index')
    end
  end
end
