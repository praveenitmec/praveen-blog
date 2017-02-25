class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title,:description, presence: true
  validates :title, uniqueness: true
end
