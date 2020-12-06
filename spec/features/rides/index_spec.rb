require 'rails_helper'

RSpec.describe 'Rides Index', type: :feature do

  it 'shows all rides' do
    epcot = ThemePark.create(name: 'Epcot', city: 'Orlando', open: false)
    magic_kingdom = ThemePark.create(name: 'Magic Kingdom', city: 'Orlando', open: true)

    ride_1 = epcot.rides.create!(name: "Mission: SPACE", max_occupants: 70, operational: true)
    ride_2 = epcot.rides.create!(name: "Test Track", max_occupants: 40, operational: false)
    ride_3 = magic_kingdom.rides.create!(name: "Space Mountain", max_occupants: 65, operational: true)

    visit '/rides'
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_1.max_occupants)
    expect(page).to have_content("Operational")
    expect(page).to have_content(ride_1.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))


    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_2.max_occupants)
    expect(page).to have_content("Not Operational")
    expect(page).to have_content(ride_2.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))

    expect(page).to have_content(ride_3.name)
    expect(page).to have_content(ride_3.max_occupants)
    expect(page).to have_content("Operational")
    expect(page).to have_content(ride_3.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))
  end
end