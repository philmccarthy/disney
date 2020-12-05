require 'rails_helper'

RSpec.describe 'Resorts Delete', type: :feature do

  it 'deletes resorts' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    visit "/resorts/#{resort_1.id}"

    expect(page).to have_content(resort_1.name)

    click_button 'Delete Resort'
    expect(page).to have_no_content(resort_1.name)
  end
end
