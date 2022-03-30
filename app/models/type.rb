class Type < ApplicationRecord
  validates :name, presence: true, length: {minimum:3}, uniqueness: true
  has_many :devices, dependent: :destroy
  has_many :brand_types, dependent: :destroy
  has_many :brands, :through=> :brand_types, dependent: :destroy
end
