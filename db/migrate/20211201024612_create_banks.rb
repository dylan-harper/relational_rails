class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :hq_city_state
      t.boolean :fdic_ins
      t.boolean :mobile_app
      t.numeric :size_by_assets

      t.timestamps
    end
  end
end
