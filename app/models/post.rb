class Post < ApplicationRecord
  belongs_to :user
  validates :title,:description, presence: true
  validates :title, uniqueness: true
end
