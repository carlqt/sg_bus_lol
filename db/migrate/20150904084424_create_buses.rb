class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :number
      t.string :corp
      t.string :routes_ids, array: true
      t.boolean :loop, default: false

      t.timestamps null: false
    end
  end
end
