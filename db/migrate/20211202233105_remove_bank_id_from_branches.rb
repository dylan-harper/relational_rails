class RemoveBankIdFromBranches < ActiveRecord::Migration[5.2]
  def change
    remove_column :branches, :bank_id, :integer
  end
end
