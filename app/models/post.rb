class Post < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: 'author_id'
    has_many :likes, class_name: 'Like', foreign_key: 'post_id'
    has_many :comments, class_name: 'Comment', foreign_key: 'post_id'

    after_save :update_posts_counter

    private
    def update_posts_counter
        author.update(posts_counter: author.posts.count)
    end

end