class ProductMailer < ApplicationMailer
  def welcome_email
    @product = params[:product]

    mail(
      to: "bdivakar14@gmail.com", # or @product.email if exists
      subject: "Product Created Successfully"
    )
  end
end
