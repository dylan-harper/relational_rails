class ElevatorcoBuildingsController < ApplicationController
  def index
    @elevatorco = Elevatorco.find(params[:id])
    @buildings = @elevatorco.buildings
  end

  def new
    @elevatorco = Elevatorco.find(params[:id])
  end

  def create
    @elevatorco = Elevatorco.find(params[:id])
    @building = @elevatorco.buildings.create(building_params)
    redirect_to "/elevatorcos/#{@elevatorco.id}/buildings"
  end

private
  def building_params
    params.permit(:name,
                  :address,
                  :owner,
                  :unit_type,
                  :num_units,
                  :year_installed,
                  :needs_modernization?,
                  :last_serviced)
  end

end
