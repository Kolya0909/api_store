class Device < ApplicationRecord
  has_one_attached :image
  has_many :device_infos, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :basket_devices, dependent: :destroy
  belongs_to :type
  belongs_to :brand
end
