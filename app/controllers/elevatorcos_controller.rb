class ElevatorcosController < ApplicationController
  def index
    @elevatorcos = Elevatorco.all
  end

  def show
    @elevatorco = Elevatorco.find(params[:id])
  end

  def new
  end 

  def create
    new = Elevatorco.create(elevatorco_params)
    redirect_to "/elevatorcos/#{new.id}"
  end

private
  def elevatorco_params
    params.permit(:name,
                  :address,
                  :num_technicians,
                  :offers_install?,
                  :offers_service?,
                  :offers_modernization?)
  end
end
