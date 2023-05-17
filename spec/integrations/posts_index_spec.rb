require 'rails_helper'

RSpec.describe 'Posts', type: :system, js: true do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Teti', photo: 'https://images.freeimages.com/images/large-previews/6b6/beach-cat-1637328.jpg',
                          bio: 'Micronaut', posts_counter: 0)
      @first_post = Post.create(author: @user, title: 'first post', text: 'Post number one, this is the first one',
                                likes_counter: 0, comments_counter: 0)
      @second_post = Post.create(author: @user, title: 'second post',
                                 text: 'Second post', likes_counter: 0, comments_counter: 0)
      @third_post = Post.create(author: @user, title: 'third post',
                                text: 'Third post', likes_counter: 0, comments_counter: 0)
      @fourth_post = Post.create(author: @user, title: 'forth post',
                                 text: 'Fourth post', likes_counter: 0, comments_counter: 0)
      @first_comment = Comment.create(author: @user, post: @second_post, text: 'like it')
      @second_comment = Comment.create(author: @user, post: @second_post, text: 'good')
      @third_comment = Comment.create(author: @user, post: @first_post, text: 'nice')
      @fourth_comment = Comment.create(author: @user, post: @first_post, text: 'foo')
      @fifth_comment = Comment.create(author: @user, post: @first_post, text: 'bar')

      visit user_posts_path(@user)
    end

    it "renders user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it "renders the user's username" do
      expect(page).to have_content(@user.name)
    end

    it "renders the user's post count" do
      expect(page).to have_content(@user.posts_counter)
    end

    it "renders the user's posts" do
      expect(page).to have_content(@fourth_post.title)
      expect(page).to have_content(@second_post.title)
      expect(page).to have_content(@third_post.title)
    end

    it "renders some of the post's body" do
      expect(page).to have_content(@fourth_post.text[0, 50])
      expect(page).to have_content(@second_post.text[0, 50])
      expect(page).to have_content(@third_post.text[0, 50])
    end

    it 'renders first comments on a post' do
      expect(page).to have_content(@first_comment.text)
      expect(page).to have_content(@second_comment.text)
    end

    it 'renders comments count of a post' do
      expect(page).to have_content(@fourth_post.comments_counter)
      expect(page).to have_content(@second_post.comments_counter)
      expect(page).to have_content(@third_post.comments_counter)
    end

    it 'renders likes count of a post' do
      expect(page).to have_content(@fourth_post.likes_counter)
      expect(page).to have_content(@second_post.likes_counter)
      expect(page).to have_content(@third_post.likes_counter)
    end

    it "redirects to a specific post's show page" do
      click_link @second_post.title
      expect(page).to have_current_path(user_post_path(@user, @second_post))
    end
  end
end