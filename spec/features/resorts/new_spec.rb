require 'rails_helper'

RSpec.describe 'Resorts New', type: :feature do

  it 'has forms' do
    visit "/resorts/new"

    expect(page).to have_field("Name")
    expect(page).to have_field("Amount of rooms")
    expect(page).to have_field("Vacancy")
    expect(page).to have_button("Create Resort")

    fill_in 'Name', with: 'new_name'
    fill_in 'Amount of rooms', with: '100'
    select 'true', from: 'Vacancy'
    click_button 'Create Resort'
    expect(page).to have_content('new_name')
  end
end
