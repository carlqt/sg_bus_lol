class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :number
      t.string :corp
      t.text :routes_id, array: true
      t.boolean :loop, default: false
      t.string :reference_code

      t.timestamps null: false
    end
  end
end
