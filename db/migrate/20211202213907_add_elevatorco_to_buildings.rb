class AddElevatorcoToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :elevatorco, foreign_key: true
  end
end
