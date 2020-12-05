require 'rails_helper'

RSpec.describe 'Resorts Edit', type: :feature do

  it 'has editing fields' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    visit "/resorts/#{resort_1.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_field("Amount of rooms")
    expect(page).to have_field("Vacancy")
    expect(page).to have_button("Edit Resort")

    fill_in 'Name', with: 'updated_name'
    fill_in 'Amount of rooms', with: '100'
    select 'true', from: 'Vacancy'
    click_button 'Edit Resort'
    expect(page).to have_content('updated_name')
    expect(page).to have_content('100')
    expect(page).to have_content('Vacancy')


    visit "/resorts/#{resort_2.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_field("Amount of rooms")
    expect(page).to have_field("Vacancy")
    expect(page).to have_button("Edit Resort")

    fill_in 'Name', with: 'updated_name'
    fill_in 'Amount of rooms', with: '100'
    select 'true', from: 'Vacancy'
    click_button 'Edit Resort'
    expect(page).to have_content('updated_name')
    expect(page).to have_content('100')
    expect(page).to have_content('Vacancy')
  end
end
