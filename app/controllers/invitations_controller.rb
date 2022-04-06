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
        redirect_to cycles_path , notice: 'All Set! Your invitation was created successfully!'
    else
        redirect_to cycles_path 
    end
  end

  private

  def invitations_params
    params.require(:email, :message, :cycle_id, :name)
  end
end
