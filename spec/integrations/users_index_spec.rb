require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  describe 'index page' do
    before(:example) do
      @user = User.create(name: 'Akite', photo: 'https://images.freeimages.com/images/large-previews/6b6/beach-cat-1637328.jpg',
                          bio: 'Full-Stack Developer from ghana', posts_counter: 0)
      visit users_path
    end

    it 'renders the list of users' do
      expect(page).to have_content(@user.name)
    end

    it "renders user's profile picture" do
      find("img[src='#{@user.photo}']")
    end

    it 'renders the number of posts for each user' do
      expect(page).to have_content(@user.posts_counter)
    end

    it "redirects to the user's show page" do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
