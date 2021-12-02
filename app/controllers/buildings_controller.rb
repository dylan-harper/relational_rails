class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end
end 
