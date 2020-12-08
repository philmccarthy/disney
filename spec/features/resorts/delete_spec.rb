require 'rails_helper'

RSpec.describe 'Resorts Delete', type: :feature do

  it 'deletes resorts' do
    resort_1 = create(:resort)
    resort_2 = create(:resort)
    
    visit "/resorts/#{resort_1.id}"

    expect(page).to have_content(resort_1.name)

    click_button 'Delete Resort'
    expect(page).to have_no_content(resort_1.name)
  end
end
