require 'rails_helper'

RSpec.describe 'Rides of ThemePark', type: :feature do
  it 'can list rides that belong to a specific theme park' do
    epcot = ThemePark.create(name: 'Epcot', city: 'Orlando', open: false)
    magic_kingdom = ThemePark.create(name: 'Magic Kingdom', city: 'Orlando', open: true)

    ride_1 = epcot.rides.create!(name: "Mission: SPACE", max_occupants: 70, operational: true)
    ride_2 = epcot.rides.create!(name: "Test Track", max_occupants: 40, operational: false)
    ride_3 = magic_kingdom.rides.create!(name: "Space Mountain", max_occupants: 65, operational: true)

    visit "/themeparks/#{epcot.id}/rides"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_1.max_occupants)
    expect(page).to have_content("Operational")
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_2.max_occupants)
    expect(page).to have_content("Not Operational")
    expect(page).to have_link("New Ride", href: "/themeparks/#{epcot.id}/rides/new")
    
    visit "/themeparks/#{magic_kingdom.id}/rides"
    
    expect(page).to have_content(ride_3.name)
    expect(page).to have_content(ride_3.max_occupants)
    expect(page).to have_content("Operational")
    expect(page).to have_link("New Ride", href: "/themeparks/#{magic_kingdom.id}/rides/new")
  end

   it 'can create new rides' do
    epcot = ThemePark.create(name: 'Epcot', city: 'Orlando', open: false)
    magic_kingdom = ThemePark.create(name: 'Magic Kingdom', city: 'Orlando', open: true)

    visit "/themeparks/#{epcot.id}/rides"
    expect(page).to have_link("New Ride", href: "/themeparks/#{epcot.id}/rides/new")
    click_link "New Ride"
    fill_in 'Name', with: 'New Ride'
    fill_in 'Max occupants', with: '1000'
    select 'true', from: 'Operational'
    click_button "Create Ride"
    expect(page).to have_content("New Ride")
    expect(page).to have_content("1000")
    expect(page).to have_content("Operational")

    visit "/themeparks/#{magic_kingdom.id}/rides"
    expect(page).to have_link("New Ride", href: "/themeparks/#{magic_kingdom.id}/rides/new")
    click_link "New Ride"
    fill_in 'Name', with: 'Ride Newer'
    fill_in 'Max occupants', with: '750'
    select 'false', from: 'Operational'
    click_button "Create Ride"
    expect(page).to have_content("Ride Newer")
    expect(page).to have_content("750")
    expect(page).to have_content("Not Operational")
  end
end