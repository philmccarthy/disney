require 'rails_helper'

RSpec.describe 'Vacationer Delete', type: :feature do
  it 'deletes vacationers' do
    vacationer_1 = create(:vacationer)

    visit "/vacationers/#{vacationer_1.id}"

    expect(page).to have_button("Delete")
    click_button "Delete Vacationer"
    expect(page).to have_no_content("#{vacationer_1.first_name}")
  end
end
