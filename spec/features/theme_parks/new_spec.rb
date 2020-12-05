require 'rails_helper'

RSpec.describe 'New ThemePark Page', type: :feature do

  it 'has form fields' do
    visit '/themeparks/new'

    expect(page).to have_field("Name")
    expect(page).to have_field("City")
    expect(page).to have_field("Open")
    expect(page).to have_button("Create Theme Park")
  end
end