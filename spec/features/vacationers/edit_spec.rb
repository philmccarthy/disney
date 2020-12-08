require 'rails_helper'

RSpec.describe 'Vacationer Show', type: :feature do
  it 'edits vacationers' do
    vacationer_1 = create(:vacationer)

    visit "/vacationers/#{vacationer_1.id}"

    expect(page).to have_link("Edit", href: "/vacationers/#{vacationer_1.id}/edit")
    click_link "Edit"
    fill_in 'First name', with: 'first_name'
    fill_in 'Last name', with: 'last_name'
    select 'true', from: 'Checked in'
    click_button "Edit Vacationer"
    expect(page).to have_content("first_name")
    expect(page).to have_content("last_name")
    expect(page).to have_content("Checked in: true")
  end
end
