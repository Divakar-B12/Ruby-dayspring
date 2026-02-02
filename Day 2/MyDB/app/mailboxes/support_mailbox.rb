class SupportMailbox < ApplicationMailbox
  def process
    # This method is for processing
    # mail.decoded gives the body of email that we receive
    # mail.from gives sender details
  end
end
