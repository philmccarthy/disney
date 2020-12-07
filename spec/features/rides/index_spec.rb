require 'rails_helper'

RSpec.describe 'Rides Index', type: :feature do

  it 'shows all rides' do
    rides = create_list(:ride, 50)

    # ride_1 = epcot.rides.create!(name: "Mission: SPACE", max_occupants: 70, operational: true)
    # ride_2 = epcot.rides.create!(name: "Test Track", max_occupants: 40, operational: false)
    # ride_3 = magic_kingdom.rides.create!(name: "Space Mountain", max_occupants: 65, operational: true)

    visit '/rides'
    expect(page).to have_field('Results with max occupants greater than:')
    expect(page).to have_content(rides.sample.name)
    expect(page).to have_content(rides.sample.max_occupants)
    expect(page).to have_content(rides.sample.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))
    
    expect(page).to have_content(rides.sample.name)
    expect(page).to have_content(rides.sample.max_occupants)
    expect(page).to have_content(rides.sample.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))
    
    expect(page).to have_content("Operational")
    expect(page).to have_content("Not Operational")
  end

  it 'shows all rides' do
    ride_1 = create(:ride, max_occupants: 100)
    ride_2 = create(:ride, max_occupants: 49)

    visit '/rides'
    expect(page).to have_content(ride_2.name)

    fill_in 'Results with max occupants greater than:', with: '50'
    click_button 'Go'
    expect(page).not_to have_content(ride_2.name)
  end
end