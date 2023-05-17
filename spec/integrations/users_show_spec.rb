require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  describe 'show page' do
    before(:example) do
      @user = User.create(name: 'Kai', photo: 'https://images.freeimages.com/images/large-previews/6b6/beach-cat-1637328.jpg',
                          bio: 'im a nice cat.', posts_counter: 0)
      @first_post = Post.create(author: @user, title: 'First title', text: 'Text of first title', likes_counter: 0,
                                comments_counter: 0)
      @second_post = Post.create(author: @user, title: 'second title', text: 'text for second title', likes_counter: 0,
                                 comments_counter: 0)
      @third_post = Post.create(author: @user, title: 'third post', text: 'text for last post', likes_counter: 0,
                                comments_counter: 0)
      @forth_post = Post.create(author: @user, title: 'last post', text: 'text for last post', likes_counter: 0,
                                comments_counter: 0)
      visit user_path(@user)
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

    it "renders the user's bio" do
      expect(page).to have_content(@user.bio)
    end

    it "renders the user's last 3 posts" do
      expect(page).to have_content(@forth_post.title)
      expect(page).to have_content(@second_post.title)
      expect(page).to have_content(@third_post.title)
    end

    it "redirects to user's posts page" do
      click_link @forth_post.title
      expect(page).to have_current_path(user_post_path(@user, @forth_post))
    end
    it 'Redirect to show all users post' do
      click_button 'see more'
      expect(page).to have_content(@first_post.title)
      expect(page).to have_content(@second_post.title)
      expect(page).to have_content(@third_post.title)
      expect(page).to have_content(@forth_post.title)
    end
  end
end
