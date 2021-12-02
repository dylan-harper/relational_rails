class BanksController < ApplicationController
  def index
    @banks = Bank.all
  end
end
