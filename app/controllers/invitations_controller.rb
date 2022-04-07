require 'mail' # we require the ruby object mail

class InvitationsController < ApplicationController
 
  def new 
    @invitation = Invitation.new
    @cycle = Cycle.find(params[:cycle_id])

    respond_to do |el|
        el.js
    end
  end

  def create
    @invitation = Invitation.new(invitations_params)

    if @invitation.save
        redirect_to cycles_path
    else
        redirect_to cycles_path 
    end
  end

  private

  def invitations_params
    params.permit(:email, :cycle_id, :message)
  end
end
