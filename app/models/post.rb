class Post < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :body, presence: true, length: { maximum: 1000 }

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
