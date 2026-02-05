class Product < ApplicationRecord

  has_many :orders
  has_one_attached :invoice
  # has_one_attached :product_picture
  has_many_attached :product_picture
  has_rich_text :Review
  # scope :blacklisted, -> { where(is_blacklisted: true) }as
  validates :name, profanity: true
  scope :out_of_stock, -> { where("stock <= ?", 0) }

   # scope :test_scope_for_joins, ->{joins(name_of_table.where)}
   # scope :test_scope, -> query{} # used to write a complex query inside the braces{}.
   # Validates that the description contains only alphabets, numbers, spaces, dots, and commas.
   # It prevents the use of special characters like @, #, $, %, etc.
   validates :description, format: { with: /\A[a-zA-Z0-9\s.,]+\z/,
              message: "only allows letters, numbers, spaces, dots and commas"
            }
end

#   validates :is_active, acceptance: { accept: true }

#    validate :price_only_if_active

#   # private

#   def price_only_if_active
#     if is_active == true && (price.nil? || price <= 0)
#       errors.add(:price, "must be present and greater than 0 when product is active")
#     end

#     if is_active == false && price.present?
#       errors.add(:price, "must be empty when product is inactive")
#     end
#   end
#    validate :stock_only_if_active

#   private

#   def stock_only_if_active
#     if is_active == true && (stock.nil? || stock <= 0)
#       errors.add(:stock, "must be present and greater than 0 when product is active")
#     end
#   end
# end
# validates :stock, numericality: true
# validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 20 }
# validates :description, length: { maximum: 500 }
# validates :price, numericality: { greater_than_or_equal_to: 3 }
#  validate :check_price

#   def check_price
#     if stock == 0 && price <= 0
#       errors.add(:price, "must be 0 when stock is 0")
#     end
#   end
# end


# @status = Product.all.limit(10).pluck(:is_active)

# @price = Product.all.limit(10).pluck(:price)

# @stock = Product.all.limit(10).pluck(:stock) # rubocop:disable Layout/CommentIndentation

# # Check if product is available in stock
# def check_availability
#   stock.to_i > 0
# end

# # Apply discount using case statement
# def apply_discount(discount_percent)
#   case discount_percent
#   when 0
#     price
#   when 1..10
#     price - (price * 0.10)
#   when 11..20
#     price - (price * 0.20)
#   when 21..30
#     price - (price * 0.30)
#   else
#     price - (price * 0.40)
#   end
# end

# # Calculate total amount after checking availability and discount
# def total_amount(discount_percent = 0)
#   unless check_availability
#     return "Out of stock"
#   end

#   discounted_price = apply_discount(discount_percent)
#   discounted_price * stock
# end
