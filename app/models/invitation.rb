class Invitation < ApplicationRecord
  belongs_to :cycle # i conect it to the model that it belongs to.

  before_validation :emailHandler #before every vaidation i check if the there is at least an input calling the private fuction.

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } # then we validate that an email is actually present and that has the right format.
  

  private

  def emailHandler
    return if email.nil? || email === '' # checks if there is at least an input
  end
end
