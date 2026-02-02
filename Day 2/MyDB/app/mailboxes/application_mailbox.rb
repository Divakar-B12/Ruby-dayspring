class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing all: :support
  # routing @any_domain
end
