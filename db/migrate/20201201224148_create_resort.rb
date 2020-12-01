class CreateResort < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.integer :resort_id
      t.string :name
      t.integer :amount_of_rooms
      t.boolean :vacancy

      t.timestamps
    end
  end
end
