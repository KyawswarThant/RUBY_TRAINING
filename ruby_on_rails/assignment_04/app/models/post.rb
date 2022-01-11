class Post < ApplicationRecord
  belongs_to :user

  # validations
  validates :title, presence: true
  validates :description, presence: true
end
