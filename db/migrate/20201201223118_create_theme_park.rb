class CreateThemePark < ActiveRecord::Migration[5.2]
  def change
    create_table :theme_parks do |t|
      t.integer :theme_park_id
      t.string :name
      t.string :city
      t.boolean :open

      t.timestamps
    end
  end
end
