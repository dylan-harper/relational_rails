class ElevatorcosController < ApplicationController
  def index
    @elevatorcos = Elevatorco.all
  end

  def show
    @elevatorco = Elevatorco.find(params[:id])
  end
end
