class CreateVacationers < ActiveRecord::Migration[5.2]
  def change
    create_table :vacationers do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :checked_in

      t.timestamps
    end
  end
end
