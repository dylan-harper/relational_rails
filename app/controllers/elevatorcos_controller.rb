class ElevatorcosController < ApplicationController
  def index
    @elevatorcos = Elevatorco.all
  end
end 
