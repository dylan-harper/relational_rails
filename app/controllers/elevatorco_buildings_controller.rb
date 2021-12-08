class ElevatorcoBuildingsController < ApplicationController
  def index
    @elevatorco = Elevatorco.find(params[:id])
    if params[:alphabetize] == "true"
      @buildings = @elevatorco.buildings.sort_by_name
    elsif params[:units].present?
      @buildings = @elevatorco.buildings.unit_threshold(params[:units])
    else
      @buildings = @elevatorco.buildings
    end
  end

  def new
    @elevatorco = Elevatorco.find(params[:id])
  end

  def create
    @elevatorco = Elevatorco.find(params[:id])
    @building = @elevatorco.buildings.create!(building_params)
    redirect_to "/elevatorcos/#{@elevatorco.id}/buildings"
  end

  def alphabetical
    @buildings = Building.sort_by_name
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
