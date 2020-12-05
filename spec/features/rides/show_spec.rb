require 'rails_helper'

RSpec.describe 'Ride Show Page', type: :feature do

  it 'shows individual ride details' do
    epcot = ThemePark.create(name: 'Epcot', city: 'Orlando', open: false)
    ride_1 = epcot.rides.create!(name: "Mission: SPACE", max_occupants: 70, operational: true)
    ride_2 = epcot.rides.create!(name: "Test Track", max_occupants: 40, operational: false)

    visit "/rides/#{ride_1.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_1.max_occupants)
    expect(page).to have_content("Operational")
    expect(page).to have_link("Edit", href: "/rides/#{ride_1.id}/edit")

    visit "/rides/#{ride_2.id}"
    save_and_open_page

    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_2.max_occupants)
    expect(page).to have_content("Not Operational")
    expect(page).to have_link("Edit", href: "/rides/#{ride_2.id}/edit")
  end
end