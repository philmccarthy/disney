require 'rails_helper'

RSpec.describe 'Rides Edit Page', type: :feature do
  it 'edits ride' do
    epcot = ThemePark.create(name: 'Magic Kingdom', city: 'Orlando', open: true)
    ride_1 = epcot.rides.create!(name: "Mission: SPACE", max_occupants: 70, operational: true)
    
    visit "/rides/#{ride_1.id}"

    expect(page).to have_link("Edit", href: "/rides/#{ride_1.id}/edit")
    click_link "Edit"
    fill_in 'Name', with: 'Not Splash Mountain'
    fill_in 'Max occupants', with: '100'
    select 'false', from: 'Operational'
    click_button "Edit Ride"
    expect(page).to have_content("Not Splash Mountain")
    expect(page).to have_content("100")
    expect(page).to have_content("Not Operational")
  end
end
