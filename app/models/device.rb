class Device < ApplicationRecord
  has_one_attached :image
  has_many :device_infos
  has_many :ratings
  has_many :basket_devices
end
