require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Donald', photo: 'https://images.freeimages.com/images/large-previews/6b6/beach-cat-1637328.jpg',
                          bio: 'baker from nigeria', posts_counter: 0)
      @second_user = User.create(name: 'TechEmprez', photo: 'https://images.freeimages.com/images/large-previews/6b6/beach-cat-1637328.jpg',
                                 bio: 'Full stack developer', posts_counter: 0)
      @example_post = Post.create(author: @user, title: 'first post', text: 'just testing my views', likes_counter: 0,
                                  comments_counter: 0)
      @first_comment = Comment.create(author: @user, post: @example_post, text: 'just a post')
      @second_comment = Comment.create(author: @second_user, post: @example_post, text: 'nice')
      @third_comment = Comment.create(author: @second_user, post: @example_post, text: 'good')

      visit user_post_path(@user, @example_post)
    end

    it 'renders the title' do
      expect(page).to have_content(@example_post.title)
    end

    it 'renders the author' do
      expect(page).to have_content(@user.name)
    end

    it 'renders comments count' do
      expect(page).to have_content(@example_post.comments_counter)
    end

    it 'renders likes count' do
      expect(page).to have_content(@example_post.likes_counter)
    end

    it 'renders the body' do
      expect(page).to have_content(@example_post.text)
    end

    it 'renders each commenter\'s username' do
      expect(page).to have_content(@second_user.name)
      expect(page).to have_content(@user.name)
    end

    it 'renders all comments' do
      expect(page).to have_content(@first_comment.text)
      expect(page).to have_content(@second_comment.text)
      expect(page).to have_content(@third_comment.text)
    end
  end
end
