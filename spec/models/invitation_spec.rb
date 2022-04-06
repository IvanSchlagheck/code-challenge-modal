require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it "is expected to have the right email validation" do
    invalid_email_invitation = build :invitation, email: "invalid.com"
    right_email_invitation = build :invitation, email: "valid@gmail.com"
      
    expect(right_email_invitation).to be_valid
    expect(invalid_email_invitation).to_not be_valid
  end

  it "is expected to have a meessage" do
    right_message_invitation = build :invitation, message: "Message"
    expect(right_message_invitation).to be_valid
  end

  it "is expected to have a name" do
    right_name_invitation = build :invitation, name: "name"
    expect(right_name_invitation).to be_valid
  end
  
end
