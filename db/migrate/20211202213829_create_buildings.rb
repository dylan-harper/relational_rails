class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.string :owner
      t.string :unit_type
      t.numeric :num_units
      t.date :year_installed
      t.boolean :needs_modernization?
      t.date :last_serviced

      t.timestamps
    end
  end
end
