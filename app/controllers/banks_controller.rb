class BanksController < ApplicationController
  def index
    @banks = Bank.all
  end

  def show
    @bank = Bank.find(params[:id])
  end
end
