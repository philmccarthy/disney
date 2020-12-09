require 'rails_helper'

RSpec.describe 'Resorts Index Page', type: :feature do
  it 'can see all resort names' do
    resort_1 = create(:resort)
    resort_2 = create(:resort)
    visit '/resorts'

    expect(page).to have_content(resort_1.name)
    expect(page).to have_content(resort_2.name)
  end

  it 'can sort by number of rooms' do
    resort_1 = create(:resort, amount_of_rooms: 200)
    resort_2 = create(:resort, amount_of_rooms: 400)

    visit '/resorts'
    fill_in 'Number of rooms', with: '300'
    click_button 'Only show resorts with more than ____ rooms'
    expect(page).to have_content(resort_2.name)
    expect(page).to have_no_content(resort_1.name)
  end

  it 'can sort by number of vacationers' do
    resort_1 = create(:resort)
    resort_2 = create(:resort)

    vacationer_1 = resort_1.vacationers.create!(first_name: "Ruby", last_name: "Dog", checked_in: true)
    vacationer_2 = resort_2.vacationers.create!(first_name: "Tina", last_name: "Dog", checked_in: true)
    vacationer_3 = resort_2.vacationers.create!(first_name: "Sam", last_name: "Jones", checked_in: false)

    visit '/resorts'
    click_button 'Sort by number of vacationers'
    expect(page).to have_content("Vacationers: #{resort_2.vacationers.count}")
    expect(page).to have_content("Vacationers: #{resort_1.vacationers.count}")
  end

  it 'can has link to edit resorts' do
    resort_1 = create(:resort)
    resort_2 = create(:resort)

    visit '/resorts'
    expect(page).to have_link("Edit", href: "/resorts/#{resort_1.id}/edit")
    expect(page).to have_link("Edit", href: "/resorts/#{resort_2.id}/edit")
  end

  it 'can delete resorts' do
    resort_1 = create(:resort)

    visit '/resorts'
    expect(page).to have_button("Delete Resort")
    first(:button, "Delete Resort").click
    expect(page).to have_no_content(resort_1.name)
  end

  it 'links to resort show' do
    resort_1 = create(:resort)
    resort_2 = create(:resort)

    visit '/resorts'
    expect(page).to have_link("#{resort_1.name}", href: "/resorts/#{resort_1.id}")
  end

  it "can search by keyword" do
    resort_1 = create(:resort, name: "Resort")
    resort_2 = create(:resort, name: "Other Resort")

    visit '/resorts'
    fill_in 'Exact match', with: 'Resort'
    click_button 'Exact match'
    expect(page).to have_content(resort_1.name)
    expect(page).to have_no_content(resort_2.name)
  end

  it "can search by partial keyword" do
    resort_1 = create(:resort, name: "Resort")
    resort_2 = create(:resort, name: "Other Resort")
    resort_3 = create(:resort, name: "Different")

    visit '/resorts'
    fill_in 'Partial match', with: 'Resort'
    click_button 'Partial match'
    expect(page).to have_content(resort_1.name)
    expect(page).to have_content(resort_2.name)
    expect(page).to have_no_content(resort_3.name)
  end


end
