class ThemePark < ApplicationRecord
  has_many :rides, dependent: :destroy

  def self.sort_by_ride_count
    select("theme_parks.*, count(rides) as ride_count")
      .joins(:rides)
      .group(:id)
      .order("ride_count DESC, open DESC, created_at DESC")
  end

  def self.default_order
    order(open: :desc, created_at: :desc)
  end
end