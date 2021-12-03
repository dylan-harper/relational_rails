class BankBranchesController < ApplicationController

  def index
    bank = Bank.find(params[:bank_id])
    @branches = bank.branches
  end
end
