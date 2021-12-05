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
    bank = Bank.create(name: params[:name],
                       hq_city_state: params[:hq_city_state],
                       fdic_ins: params[:fdic_ins],
                       mobile_app: params[:mobile_app],
                       size_by_assets: params[:size_by_assets])
    redirect_to "/banks"
  end

end
