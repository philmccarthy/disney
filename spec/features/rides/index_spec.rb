require 'rails_helper'

RSpec.describe 'Rides Index', type: :feature do

  it 'shows all rides' do
    rides = create_list(:ride, 50)

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

  it "can search by keyword" do
    ride_1 = create(:ride, name: "Ride")
    ride_2 = create(:ride, name: "Other Ride")

    visit '/rides'
    fill_in 'Exact match', with: 'Ride'
    click_button 'Exact match'
    expect(page).to have_content(ride_1.name)
    expect(page).to have_no_content(ride_2.name)
  end

  it "can search by partial keyword" do
    ride_1 = create(:ride, name: "Ride")
    ride_2 = create(:ride, name: "Other Ride")
    ride_3 = create(:ride, name: "Different")

    visit '/rides'
    fill_in 'Partial match', with: 'Ride'
    click_button 'Partial match'
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_no_content(ride_3.name)
  end
end
