class AddBankToBranches < ActiveRecord::Migration[5.2]
  def change
    add_reference :branches, :bank, foreign_key: true
  end
end
