class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    @building.update(building_params)
    redirect_to "/buildings/#{@building.id}"
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
