class CreateBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :branches do |t|
      t.string :name
      t.integer :zip_code
      t.boolean :has_atm
      t.numeric :quarterly_rev
      t.integer :bank_id

      t.timestamps
    end
  end
end
