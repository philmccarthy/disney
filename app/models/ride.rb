class Ride < ApplicationRecord
  belongs_to :theme_park

  def self.min_occupants(amount)
    where('max_occupants >= ?', amount)
  end
end