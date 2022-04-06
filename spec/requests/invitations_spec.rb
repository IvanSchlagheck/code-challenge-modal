require 'rails_helper'

RSpec.describe "Invitations", type: :request do
  describe 'POST / create' do
    let!(:visible_cycle) { create :cycle, public_status: true }

    it "returns 200" do
      expect{post cycle_invitations_path(visible_cycle.id), params: { email: "email@email.com", message: "mymessage", name: "myname"}}
      .to change(Invitation, :count).by(1)
    end
  end
end
