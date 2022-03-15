class Device < ApplicationRecord
  has_many :device_infos
  has_many :ratings
  has_many :basket_devices
end
