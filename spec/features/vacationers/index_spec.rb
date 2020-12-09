require 'rails_helper'

RSpec.describe 'Vacationer Index', type: :feature do

  it 'shows all vacationers' do
    vacationer_1 = create(:vacationer)
    vacationer_2 = create(:vacationer)
    vacationer_3 = create(:vacationer)

    visit '/vacationers'

    expect(page).to have_content(vacationer_1.first_name)
    expect(page).to have_content(vacationer_1.last_name)
    expect(page).to have_content(vacationer_1.checked_in)

    expect(page).to have_content(vacationer_2.first_name)
    expect(page).to have_content(vacationer_2.last_name)
    expect(page).to have_content(vacationer_2.checked_in)

    expect(page).to have_content(vacationer_3.first_name)
    expect(page).to have_content(vacationer_3.last_name)
    expect(page).to have_content(vacationer_3.checked_in)
  end

  it 'links to edit vacationers' do
    vacationer_1 = create(:vacationer)
    vacationer_2 = create(:vacationer)
    vacationer_3 = create(:vacationer)

    visit '/vacationers'

    expect(page).to have_link("Edit", href: "/vacationers/#{vacationer_1.id}/edit")
    expect(page).to have_link("Edit", href: "/vacationers/#{vacationer_2.id}/edit")
    expect(page).to have_link("Edit", href: "/vacationers/#{vacationer_2.id}/edit")
  end

  it 'can delete vacationers' do
    vacationer_1 = create(:vacationer)

    visit '/vacationers'

    expect(page).to have_button("Delete Vacationer")
    first(:button, "Delete Vacationer").click
    expect(page).to have_no_content(vacationer_1.first_name)
  end

  it 'links vacationer name to show' do
    vacationer_1 = create(:vacationer)
    vacationer_2 = create(:vacationer)
    vacationer_3 = create(:vacationer)

    visit '/vacationers'

    expect(page).to have_link("#{vacationer_1.first_name}", href: "/vacationers/#{vacationer_1.id}")
    expect(page).to have_link("#{vacationer_2.first_name}", href: "/vacationers/#{vacationer_2.id}")
    expect(page).to have_link("#{vacationer_3.first_name}", href: "/vacationers/#{vacationer_3.id}")
  end

  it "can search by keyword" do
    vacationer_1 = create(:vacationer, first_name: "Vacationer")
    vacationer_2 = create(:vacationer, first_name: "Other Vacationer")

    visit '/vacationers'
    fill_in 'Exact match', with: 'Vacationer'
    click_button 'Exact match'
    expect(page).to have_content(vacationer_1.first_name)
    expect(page).to have_no_content(vacationer_2.first_name)
  end

  it "can search by partial keyword" do
    vacationer_1 = create(:vacationer, first_name: "Vacationer")
    vacationer_2 = create(:vacationer, first_name: "Other Vacationer")
    vacationer_3 = create(:vacationer, first_name: "Different")

    visit '/vacationers'
    fill_in 'Partial match', with: 'Vacationer'
    click_button 'Partial match'
    expect(page).to have_content(vacationer_1.first_name)
    expect(page).to have_content(vacationer_2.first_name)
    expect(page).to have_no_content(vacationer_3.first_name)
  end
end
