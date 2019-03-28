class Review < ApplicationRecord
  belongs_to :post, counter_cache: :reviews_count
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 500 }

end
