require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it {should belong_to :theme_park}
  end

  describe 'class methods' do
    describe '.min_occupants' do
      it 'returns rides with max occupants above argument' do
        disneyland = ThemePark.create!(name: 'Disneyland', city: 'Los Angeles', open: true)
        ride_1 = disneyland.rides.create!(name: 'Ride 1', max_occupants: 75, operational: true)
        ride_2 = disneyland.rides.create!(name: 'Ride 2', max_occupants: 100, operational: false)
        ride_3 = disneyland.rides.create!(name: 'Ride 3', max_occupants: 125, operational: true)
        expect(Ride.min_occupants(100).count).to eq(2)

      end
    end
  end
end