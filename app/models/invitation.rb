require 'mail'

class Invitation < ApplicationRecord
  belongs_to :cycle # i conect it to the model that it belongs to.

  before_validation :email_handler #before every vaidation i check if the there is at least an input calling the private fuction.

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } # then we validate that an email is actually present and that has the right format.
  

  private

  def email_handler
    return if email.nil? || email === '' # checks if there is at least an input

    email_to_check = Mail::Address.new(email) #we introduce the email from the form in the Mail object/gem from ruby. More info about it here: https://www.rubydoc.info/gems/mail/2.3.0/Mail/Address
    self.email = email_to_check.address

    if email_to_check.display_name #if the email has a display name
      self.name = email_to_check.display_name #i assign it to the name intance variable of invitation that we would be dealing with
    elsif email_to_check.local #otherwise i retrieve what is in the left side of the '@'
      self.name = local_name_shaper(email_to_check.local) #and i assign it to the name of the intance variable of invitation that we would be dealing with
    end
  end

  def local_name_shaper(name)
    name.gsub(/\.|-|_|!/, ' ').gsub(/\d+/,"").titleize
  end
end
  