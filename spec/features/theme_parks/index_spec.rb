require 'rails_helper'

RSpec.describe 'ThemeParks Index Page', type: :feature do
  it 'can see all theme parks names' do
    tp_1 = create(:theme_park, open: true)
    tp_2 = create(:theme_park, open: false)

    visit '/themeparks'

    expect(page).to have_content(tp_1.name)
    expect(page).to have_content(tp_1.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))

    expect(page).to have_content(tp_2.name)
    expect(page).to have_content(tp_2.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))
    expect(page).to have_link("New Theme Park", href: '/themeparks/new')
  end
end