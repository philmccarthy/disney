require 'rails_helper'

RSpec.describe 'ThemeParks Edit Page', type: :feature do

  it 'has editing fields' do
    tp_1 = ThemePark.create(name: 'Magic Kingdom', city: 'Orlando', open: true)
    tp_2 = ThemePark.create(name: 'Epcot', city: 'Orlando', open: false)

    visit "/themeparks/#{tp_1.id}/edit"
    expect(page).to have_field("Name")
    expect(page).to have_field("City")
    expect(page).to have_field("Open")
    expect(page).to have_button("Edit Theme Park")

    fill_in 'Name', with: 'updated name'
    fill_in 'City', with: 'updated city'
    select 'false', from: 'Open'
    click_button 'Edit Theme Park'
    expect(page).to have_content('updated name')
    expect(page).to have_content('updated city')
    expect(page).to have_content('Closed')


    visit "/themeparks/#{tp_2.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_field("City")
    expect(page).to have_field("Open")
    expect(page).to have_button("Edit Theme Park")

    fill_in 'Name', with: 'updated name'
    fill_in 'City', with: 'updated city'
    select 'true', from: 'Open'
    click_button 'Edit Theme Park'
    expect(page).to have_content('updated name')
    expect(page).to have_content('updated city')
    expect(page).to have_content('Open')
  end
end