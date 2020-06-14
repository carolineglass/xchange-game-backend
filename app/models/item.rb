class Item < ApplicationRecord
    has_many :conversions
    has_many :countries, through: :conversions
end
