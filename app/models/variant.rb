class Variant < ApplicationRecord
  has_one_attached :image
  belongs_to :product 
  has_many :variant_option_values
  has_many :option_values, through: :variant_option_values
end
