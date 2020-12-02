class AddResortsToVacationers < ActiveRecord::Migration[5.2]
  def change
    add_reference :vacationers, :resort, foreign_key: true
  end
end
