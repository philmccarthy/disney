require 'rails_helper'

RSpec.describe 'Resorts Edit', type: :feature do

  it 'has editing fields' do
    resort_1 = create(:resort)
    resort_2 = create(:resort)
    
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
