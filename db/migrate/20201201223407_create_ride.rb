class CreateRide < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :max_occupants
      t.boolean :opperational

      t.timestamps
    end
  end
end
