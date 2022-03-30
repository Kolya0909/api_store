class Brand < ApplicationRecord
  validates :name, presence: true, length: {minimum:3}, uniqueness: true
  has_many :devices, dependent: :destroy
  has_many :brand_types
  has_many :types, :through => :brand_types
end
