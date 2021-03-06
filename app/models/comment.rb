class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed in comment" }
end
