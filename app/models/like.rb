class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post
  after_save :increment_like_counter

  # update like counter
  def increment_like_counter
    post.increment!(:likes_counter)
  end
end
