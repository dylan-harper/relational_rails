class ElevatorcosController < ApplicationController
  def index
    @elevatorcos = Elevatorco.sort_by_created
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

  def edit
    @elevatorco = Elevatorco.find(params[:id])
  end

  def update
    @elevatorco = Elevatorco.find(params[:id])
    @elevatorco.update(elevatorco_params)
    redirect_to "/elevatorcos/#{@elevatorco.id}"
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
