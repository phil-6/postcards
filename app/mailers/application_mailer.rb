class ApplicationMailer < ActionMailer::Base
  default from: 'Postcards from a Stranger <postmaster@purpleriver.dev>'
  layout 'mailer'
end
