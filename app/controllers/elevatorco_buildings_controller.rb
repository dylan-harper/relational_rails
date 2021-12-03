class ElevatorcoBuildingsController < ApplicationController
  def index
    @elevatorco = Elevatorco.find(params[:elevatorco_id])
    @buildings = @elevatorco.buildings
  end
end 
