class Post < ApplicationRecord

validates :title, presence: true
validates :description, presence: true
validates :keywords, presence: true

has_many_attached :images
belongs_to :user
has_many :comments
has_many :likes
end
