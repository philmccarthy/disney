require 'rails_helper'

RSpec.describe 'Vacationers in Resort', type: :feature do
  it 'can list vacationers that belong to a specific resort' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    vacationer_1 = resort_1.vacationers.create!(first_name: "Ruby", last_name: "Dog", checked_in: true)
    vacationer_2 = resort_1.vacationers.create!(first_name: "Tina", last_name: "Dog", checked_in: true)
    vacationer_3 = resort_2.vacationers.create!(first_name: "Sam", last_name: "Jones", checked_in: false)

    visit "/resorts/#{resort_1.id}/vacationers"

    expect(page).to have_content(vacationer_1.first_name)
    expect(page).to have_content(vacationer_1.last_name)
    expect(page).to have_content(vacationer_1.checked_in)
    expect(page).to have_content(vacationer_2.first_name)
    expect(page).to have_content(vacationer_2.last_name)
    expect(page).to have_content(vacationer_2.checked_in)
    expect(page).to have_link("New Vacationer", href: "/resorts/#{resort_1.id}/vacationers/new")
    click_link "New Vacationer"
    fill_in 'First name', with: 'first_name'
    fill_in 'Last name', with: 'last_name'
    select 'true', from: 'Checked in'
    click_button "Create Vacationer"
    expect(page).to have_content("first_name")
    expect(page).to have_content("last_name")
    expect(page).to have_content("Checked in: true")

    visit "/resorts/#{resort_2.id}/vacationers"
    expect(page).to have_content(vacationer_3.first_name)
    expect(page).to have_content(vacationer_3.last_name)
    expect(page).to have_content(vacationer_3.checked_in)
    expect(page).to have_link("New Vacationer", href: "/resorts/#{resort_2.id}/vacationers/new")
    click_link "New Vacationer"
    fill_in 'First name', with: 'first_name'
    fill_in 'Last name', with: 'last_name'
    select 'true', from: 'Checked in'
    click_button "Create Vacationer"
    expect(page).to have_content("first_name")
    expect(page).to have_content("last_name")
    expect(page).to have_content("Checked in: true")
  end
end
