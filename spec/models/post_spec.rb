require 'rails_helper'

RSpec.describe Post, type: :model do
  include Shoulda::Matchers::ActiveModel
  let(:user) { User.create(name: 'Akite donald') }

  subject { described_class.new(title: 'My Post', author_id: user.id, comments_counter: 0, likes_counter: 0) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it {
      should validate_length_of(:title).is_at_most(250).with_message('title must not be greater than 250 characters')
    }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }
  end

  describe 'callbacks' do
    describe 'after_save' do
      it 'updates posts_counter of author' do
        expect { subject.save }.to change { user.reload.posts_counter }.from(0).to(1)
      end
    end
  end
end
