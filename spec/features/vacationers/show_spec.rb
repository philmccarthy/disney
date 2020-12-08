require 'rails_helper'

RSpec.describe 'Vacationer Show', type: :feature do

  it 'shows vacationer with attributes' do
    vacationer_1 = create(:vacationer)
    vacationer_2 = create(:vacationer)
    vacationer_3 = create(:vacationer)
    
    visit "/vacationers/#{vacationer_1.id}"

    expect(page).to have_content(vacationer_1.first_name)
    expect(page).to have_content(vacationer_1.last_name)
    expect(page).to have_content(vacationer_1.checked_in)

    visit "/vacationers/#{vacationer_2.id}"

    expect(page).to have_content(vacationer_2.first_name)
    expect(page).to have_content(vacationer_2.last_name)
    expect(page).to have_content(vacationer_2.checked_in)

    visit "/vacationers/#{vacationer_3.id}"

    expect(page).to have_content(vacationer_3.first_name)
    expect(page).to have_content(vacationer_3.last_name)
    expect(page).to have_content(vacationer_3.checked_in)
  end

end
