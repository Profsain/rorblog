class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  after_save :increment_post_counter

  # update post counter
  def increment_post_counter
    author.increment!(:posts_counter)
  end

  def fetch_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def fetch_recent_likes
    likes.order(created_at: :desc).limit(5)
  end
end
