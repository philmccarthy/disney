require 'rails_helper'

RSpec.describe 'Resorts Show Page', type: :feature do

  it 'can see attributes of a resort' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    visit "/resorts/#{resort_1.id}"

    expect(page).to have_content(resort_1.name)
    expect(page).to have_content(resort_1.amount_of_rooms)
    expect(page).to have_content("Vacancy")
    expect(page).to have_link("Edit", href: "/resorts/#{resort_1.id}/edit")
    expect(page).to have_button("Delete Resort")

    visit "/resorts/#{resort_2.id}"

    expect(page).to have_content(resort_2.name)
    expect(page).to have_content(resort_2.amount_of_rooms)
    expect(page).to have_content("No Vacancy")
    expect(page).to have_link("Edit", href: "/resorts/#{resort_2.id}/edit")
    expect(page).to have_button("Delete Resort")
  end
end
