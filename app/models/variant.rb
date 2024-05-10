class Variant < ApplicationRecord
  has_one_attached :image
  belongs_to :product
  belongs_to :option_value
end
