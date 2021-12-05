class BankBranchesController < ApplicationController

  def index
    @bank = Bank.find(params[:bank_id])
    @branches = @bank.branches
  end

  def new
    @bank = Bank.find(params[:id])
  end

  def create
    @bank = Bank.find(params[:id])
    @branch = @bank.branches.create(branch_params)
    redirect_to "/banks/#{@bank.id}/branches"
  end

  def branch_params
    params.permit(:name, :zip_code, :has_atm, :quarterly_rev)
  end
end
