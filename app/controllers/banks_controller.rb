class BanksController < ApplicationController
  def index
    @banks = Bank.sort_by_created
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

  def destroy
    bank = Bank.find(params[:id])
    bank.destroy
    redirect_to '/banks'
  end

  def edit
    @bank = Bank.find(params[:id])
  end

  def update
    bank = Bank.find(params[:id])
    bank.update(bank_params)
    redirect_to '/banks'
  end

  private

  def bank_params
    params.permit(:name, :hq_city_state, :fdic_ins, :mobile_app, :size_by_assets)
  end

end
