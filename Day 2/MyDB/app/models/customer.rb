class Customer < ApplicationRecord
  has_one_attached :profile_photo
  has_rich_text :about_me
  # scope :blacklisted, -> { where(is_blacklisted: true) }
  # scope :unique_email, ->(email) { where(email: "spvenkatesh010@gmail.com") }
  # scope :unique_email, ->(email) { where(email: email) }
  # scope :unique_email, -> { where(email: "spvenkatesh010@gmail.com") }
  # scope :unique_email, ->(email) { where(email: email).distinct.limit(1) }
  scope :blacklisted, ->(customer_ids) { where(id: customer_ids) }

  # validates :name, profanity: true
  # validates :email, profanity: true

  # Check whether email is present or not
  # def check_email
  #   if email.nil? || email.strip.
  #     "Email is not present"
  #   else
  #     "Email is present"
  #   end
  # end

  # # Check whether name contains only alphabetic characters
  # def name_check
  #   if name.nil? || name.strip.empty?
  #     "Name is empty"
  #   elsif name.match?(/\A[a-zA-Z]+\z/)
  #     "Name is valid"
  #   else
  #     "Name must contain only alphabets"
  #   end
  # end
end
