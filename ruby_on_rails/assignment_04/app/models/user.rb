class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy

  # validations
  validates :name, presence: true
  validates :email, presence: true
end
