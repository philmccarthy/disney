require 'rails_helper'

RSpec.describe 'ThemeParks Index Page', type: :feature do
  it 'can see all theme parks names' do
    tp_1 = ThemePark.create(name: 'Magic Kingdom', city: 'Orlando', open: true)
    tp_2 = ThemePark.create(name: 'Epcot', city: 'Orlando', open: false)

    visit '/themeparks'

    expect(page).to have_content(tp_1.name)
    expect(page).to have_content(tp_2.name)
    expect(page).to have_link("New Theme Park", href: '/themeparks/new')
  end
end