require 'rails_helper'

RSpec.describe 'ThemeParks Show Page', type: :feature do

  it 'can see attributes of one theme park' do
    tp_1 = create(:theme_park, open: true)
    tp_2 = create(:theme_park, open: false)

    visit "/themeparks/#{tp_1.id}"
    
    expect(page).to have_content(tp_1.name)
    expect(page).to have_content(tp_1.city)
    expect(page).to have_content("Open")
    expect(page).to have_link("Edit", href: "/themeparks/#{tp_1.id}/edit")
    expect(page).to have_button('Delete Theme Park')
    
    visit "/themeparks/#{tp_2.id}"
    
    expect(page).to have_content(tp_2.name)
    expect(page).to have_content(tp_2.city)
    expect(page).to have_content("Closed")
    expect(page).to have_link("Edit", href: "/themeparks/#{tp_2.id}/edit")
    expect(page).to have_button('Delete Theme Park')
  end

  it 'deletes theme parks' do
    tp_1 = create(:theme_park)

    visit "/themeparks/#{tp_1.id}"

    expect(page).to have_content(tp_1.name)
    click_button 'Delete Theme Park'
    expect(page).to have_no_content(tp_1.name)
  end
end