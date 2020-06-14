class Country < ApplicationRecord
    has_many :conversions
    has_many :items, through: :conversions
end
