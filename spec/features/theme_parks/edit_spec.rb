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

    visit "/themeparks/#{tp_2.id}/edit"

    expect(page).to have_field("Name")
    expect(page).to have_field("City")
    expect(page).to have_field("Open")
    expect(page).to have_button("Edit Theme Park")
  end
end