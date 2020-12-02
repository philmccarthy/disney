class AddThemeParksToRides < ActiveRecord::Migration[5.2]
  def change
    add_reference :rides, :theme_park, foreign_key: true
  end
end
