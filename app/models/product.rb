class Product < ApplicationRecord
    has_many :sales, dependent: :destroy
    has_many :track_inventories, dependent: :destroy
end
