class Offer < ApplicationRecord
  has_many :products, through: :product_offers
end
