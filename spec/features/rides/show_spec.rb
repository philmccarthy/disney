require 'rails_helper'

RSpec.describe 'Ride Show Page', type: :feature do

  it 'shows individual ride details' do
    ride_1 = create(:ride, operational: true)
    ride_2 = create(:ride, operational: false)

    visit "/rides/#{ride_1.id}"

    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_1.max_occupants)
    expect(page).to have_content("Operational")
    expect(page).to have_link("Edit", href: "/rides/#{ride_1.id}/edit")
    expect(page).to have_button("Delete")

    visit "/rides/#{ride_2.id}"

    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_2.max_occupants)
    expect(page).to have_content("Not Operational")
    expect(page).to have_link("Edit", href: "/rides/#{ride_2.id}/edit")
    expect(page).to have_button("Delete")
  end

  it 'deletes vacationers' do
    ride_1 = create(:ride, operational: true)

    visit "/rides/#{ride_1.id}"
    expect(page).to have_content(ride_1.name)

    click_button "Delete Ride"
    expect(page).not_to have_content(ride_1.name)
  end
end