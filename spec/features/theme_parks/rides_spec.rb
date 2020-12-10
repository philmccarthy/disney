require 'rails_helper'

RSpec.describe 'Rides of ThemePark', type: :feature do
  it 'can list rides that belong to a specific theme park' do
    theme_park = create(:theme_park)
    rides = create_list(:ride, 10, theme_park: theme_park)

    visit "/themeparks/#{theme_park.id}/rides"

    expect(page).to have_content(theme_park.rides.count)
    expect(page).to have_content(rides.first.name)
    expect(page).to have_content(rides.first.max_occupants)
    expect(page).to have_content(rides.last.name)
    expect(page).to have_content(rides.last.max_occupants)
    expect(page).to have_content("Operational")
    expect(page).to have_content("Not Operational")
    expect(page).to have_link("New Ride", href: "/themeparks/#{theme_park.id}/rides/new")    
  end

   it 'can create new rides' do
    epcot = create(:theme_park)
    magic_kingdom = create(:theme_park)

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

  it 'sorts rides alphabetically' do
    epcot = create(:theme_park)
    xyz = create(:ride, name: "xyz", theme_park: epcot)
    abc = create(:ride, name: "abc", theme_park: epcot)
    visit "/themeparks/#{epcot.id}/rides"
    click_button "Alphabetize"
    expect(abc.name).to appear_before(xyz.name)
  end
end