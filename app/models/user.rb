class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes

  # validations
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  
  # A method that returns the 3 most recent posts for a given user
  def fetch_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
