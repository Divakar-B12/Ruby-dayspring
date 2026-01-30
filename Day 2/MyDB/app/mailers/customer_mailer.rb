class CustomerMailer < ApplicationMailer
  def welcome_email
    @customer = params[:customer]
    mail(to: @customer.email, subject: "Welcome to Our Application")
  end
end
