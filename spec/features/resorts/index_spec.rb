require 'rails_helper'

RSpec.describe 'Resorts Index Page', type: :feature do
  it 'can see all resort names' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    visit '/resorts'

    expect(page).to have_content(resort_1.name)
    expect(page).to have_content(resort_2.name)
    expect(page).to have_link("New Resort", href: '/resorts/new/')
    expect(page).to have_link("Edit", href: "/resorts/#{resort_1.id}/edit")
    expect(page).to have_link("Edit", href: "/resorts/#{resort_2.id}/edit")
  end

  it 'can sort by number of rooms' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    visit '/resorts'
    fill_in 'Number of rooms', with: '300'
    click_button 'Only show resorts with more than ____ rooms'
    expect(page).to have_content(resort_2.name)
    expect(page).to have_no_content(resort_1.name)
  end

  it 'can sort by number of vacationers' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    vacationer_1 = resort_1.vacationers.create!(first_name: "Ruby", last_name: "Dog", checked_in: true)
    vacationer_2 = resort_2.vacationers.create!(first_name: "Tina", last_name: "Dog", checked_in: true)
    vacationer_3 = resort_2.vacationers.create!(first_name: "Sam", last_name: "Jones", checked_in: false)

    visit '/resorts'
    click_button 'Sort by number of vacationers'
    expect(page).to have_content("Vacationers: #{resort_2.vacationers.count}")
    expect(page).to have_content("Vacationers: #{resort_1.vacationers.count}")
  end

end
