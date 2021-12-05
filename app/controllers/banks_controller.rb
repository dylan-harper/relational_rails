class BanksController < ApplicationController
  def index
    @banks = Bank.all
    @banks = @banks.order("created_at").all
  end

  def show
    @bank = Bank.find(params[:id])
  end

  def new
  end

  def create
    bank = Bank.create(bank_params)
    redirect_to "/banks"
  end

  def bank_params
    params.permit(:name, :hq_city_state, :fdic_ins, :mobile_app, :size_by_assets)
  end

end
