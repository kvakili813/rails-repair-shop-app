class RepairmenController < ApplicationController
  def home
    if !current_repairman
      render 'static/visitor'
    end
    @repairman = current_repairman
  end

  def show
      @repairman = Repairman.find(params[:id])
    end

end
