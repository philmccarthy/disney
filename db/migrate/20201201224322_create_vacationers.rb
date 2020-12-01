class CreateVacationers < ActiveRecord::Migration[5.2]
  def change
    create_table :vacationers do |t|
      t.integer :vacationer_id
      t.string :first_name
      t.string :last_name
      t.integer :resort_id
      t.boolean :checked_in

      t.timestamps
    end
  end
end
