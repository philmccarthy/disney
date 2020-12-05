class FixRideColTypo < ActiveRecord::Migration[5.2]
  def change
    rename_column :rides, :opperational, :operational
  end
end
