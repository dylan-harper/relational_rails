class BranchesController < ApplicationController

  def index
    @branches = Branch.display_true
  end

  def show
    @branch = Branch.find(params[:id])
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def update
    branch = Branch.find(params[:id])
    branch.update(branch_params)
    redirect_to "/branches/#{branch.id}"
  end

  def branch_params
    params.permit(:name, :zip_code, :has_atm, :quarterly_rev)
  end
end
