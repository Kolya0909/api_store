class Brand < ApplicationRecord
  validates :name, presence: true, length: {minimum:3}
  has_many :devices
  has_and_belongs_to_many :types
end
