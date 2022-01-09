class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :name, presence: true
end
