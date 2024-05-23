class OptionType < ApplicationRecord
    has_many :option_values

    validates :name, presence: true, uniqueness: true
end
