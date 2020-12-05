require 'rails_helper'

RSpec.describe 'Vacationer Show', type: :feature do
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
    expect(page).to have_content("first_name")
    expect(page).to have_content("last_name")
    expect(page).to have_content("Checked in: true")
  end
end
