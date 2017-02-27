class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags
  validates :title,:description, presence: true
  validates :title, uniqueness: true
end
