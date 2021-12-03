class BanksController < ApplicationController
  def index
    @banks = Bank.all
    @banks = @banks.order("created_at").all
  end

  def show
    @bank = Bank.find(params[:id])
  end

end
