require 'rails_helper'

RSpec.describe 'Vacationer Delete', type: :feature do
  it 'deletes vacationers' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    vacationer_1 = resort_1.vacationers.create!(first_name: "Ruby", last_name: "Dog", checked_in: true)

    visit "/vacationers/#{vacationer_1.id}"

    expect(page).to have_button("Delete")
    click_button "Delete Vacationer"
    expect(page).to have_no_content("Ruby")
  end
end 
