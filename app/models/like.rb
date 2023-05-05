class Like < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post

    after_save :update_likes_count
    private
    def update_likes_count
        post.update(likes_counter: post.likes.count)
    end
end