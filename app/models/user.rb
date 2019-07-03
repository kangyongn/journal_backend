class User < ApplicationRecord
  has_secure_password

  has_many :journals

  validates :email, uniqueness: true
end
