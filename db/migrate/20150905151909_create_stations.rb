class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.integer :bus_code_id
      t.string :station_code
      t.string :road
      t.string :description
      t.string :summary

      t.timestamps null: false
    end
  end
end
