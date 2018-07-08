class Product < ApplicationRecord
    validates :name, :price, :unit, presence: true
end
