require 'rails_helper'

RSpec.describe 'Vacationer Show', type: :feature do

  it 'shows vacationer with attributes' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    vacationer_1 = resort_1.vacationers.create!(first_name: "Ruby", last_name: "Dog", checked_in: true)
    vacationer_2 = resort_1.vacationers.create!(first_name: "Tina", last_name: "Dog", checked_in: true)
    vacationer_3 = resort_2.vacationers.create!(first_name: "Sam", last_name: "Jones", checked_in: false)

    visit "/vacationers/#{vacationer_1.id}"

    expect(page).to have_content(vacationer_1.first_name)
    expect(page).to have_content(vacationer_1.last_name)
    expect(page).to have_content(vacationer_1.checked_in)

    visit "/vacationers/#{vacationer_2.id}"

    expect(page).to have_content(vacationer_2.first_name)
    expect(page).to have_content(vacationer_2.last_name)
    expect(page).to have_content(vacationer_2.checked_in)

    visit "/vacationers/#{vacationer_3.id}"

    expect(page).to have_content(vacationer_3.first_name)
    expect(page).to have_content(vacationer_3.last_name)
    expect(page).to have_content(vacationer_3.checked_in)
  end

  it 'edits vacationers' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    vacationer_1 = resort_1.vacationers.create!(first_name: "Ruby", last_name: "Dog", checked_in: true)

    visit "/vacationers/#{vacationer_1.id}"

    expect(page).to have_link("Edit", href: "/vacationers/#{vacationer_1.id}/edit")
    click_link "Edit"
    fill_in 'First name', with: 'first_name'
    fill_in 'Last name', with: 'last_name'
    select 'true', from: 'Checked in'
    click_button "Edit Vacationer"
    save_and_open_page
    expect(page).to have_content("first_name")
    expect(page).to have_content("last_name")
    expect(page).to have_content("Checked in: true")

  end

end
