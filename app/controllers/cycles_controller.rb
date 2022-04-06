class CyclesController < ApplicationController
  def index
    @cycles = Cycle.where(public_status: true) ## 1 I only pick up the cycles where public status is true
  end
end
