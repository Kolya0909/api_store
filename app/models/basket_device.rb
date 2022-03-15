class BasketDevice < ApplicationRecord
  belongs_to :device
  belongs_to :basket
end
