class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, length:  {minimum: 3}, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }

  has_one :basket
  has_many :ratings
end
