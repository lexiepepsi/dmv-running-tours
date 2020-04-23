class CreateRun < ActiveRecord::Migration[5.2]
  def change
    create_table :runs do |t|
      t.string :name
      t.string :location
      t.integer :distance
      t.string :duration
      t.text :description
      t.timestamps
    end
    add_index :runs, [:name, :location], unique: true
  end
end
