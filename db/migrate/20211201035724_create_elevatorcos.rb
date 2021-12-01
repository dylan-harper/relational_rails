class CreateElevatorcos < ActiveRecord::Migration[5.2]
  def change
    create_table :elevatorcos do |t|
      t.string :name
      t.string :address
      t.numeric :num_technicians
      t.boolean :offers_install?
      t.boolean :offers_service?
      t.boolean :offers_modernization?

      t.timestamps
    end
  end
end
