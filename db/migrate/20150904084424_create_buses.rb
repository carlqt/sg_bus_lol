class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :number
      t.string :corp
      t.array :routes
      t.boolean :loop
      t.string :reference_code

      t.timestamps null: false
    end
  end
end
