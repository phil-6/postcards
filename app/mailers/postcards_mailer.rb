class PostcardMailer < ApplicationMailer

  default from: 'Postcards from a Stranger <postmaster@purpleriver.dev>'

  def new_postcard_email

    @postcard
    @user = User.find(@postcard.sent_to)
    @url  = 'https://postcards.purpleriver.dev/users/sign_in'
    mail(to: @user.email,from: 'Postcards from a Stranger <postmaster@purpleriver.dev>', bcc:'postmaster@purpleriver.dev', subject: 'You have a new Postcard')
  end
end