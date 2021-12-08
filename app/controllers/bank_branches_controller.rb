class BankBranchesController < ApplicationController

  def index
      @bank = Bank.find(params[:bank_id])
      @branches = []
    if params[:alphabetize] == 'true'
      @branches = @bank.order_by_name
    elsif params[:revenue].present?
      @branches = @bank.branches.revenue_threshold(params[:revenue])
    else
      @branches = @bank.branches
    end
  end

  def new
    @bank = Bank.find(params[:id])
  end

  def create
    @bank = Bank.find(params[:id])
    @branch = @bank.branches.create(branch_params)
    redirect_to "/banks/#{@bank.id}/branches"
  end

  private

  def branch_params
    params.permit(:name, :zip_code, :has_atm, :quarterly_rev)
  end
end
