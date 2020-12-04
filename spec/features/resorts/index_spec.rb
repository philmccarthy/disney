require 'rails_helper'

RSpec.describe 'Resorts Index Page', type: :feature do
  it 'can see all resort names' do
    resort_1 = Resort.create(name: 'Country Villas', amount_of_rooms: 230, vacancy: true)
    resort_2 = Resort.create(name: 'Seaside Shack', amount_of_rooms: 450, vacancy: false)

    visit '/resorts'

    expect(page).to have_content(resort_1.name)
    expect(page).to have_content(resort_2.name)
    expect(page).to have_link("New Resort", href: '/resorts/new/')
  end
end
