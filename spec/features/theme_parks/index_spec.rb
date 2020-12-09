require 'rails_helper'


RSpec.describe 'ThemeParks Index Page', type: :feature do
  describe 'themeparks index' do
    before(:each) do
    @tp_1 = create(:theme_park, open: true)
    @tp_2 = create(:theme_park, open: false)
    create_list(:ride, 5, theme_park: @tp_1)
    create_list(:ride, 10, theme_park: @tp_2)
    end

    it 'can see all theme parks' do
      visit '/themeparks'

      expect(page).to have_content(@tp_1.name)
      expect(page).to have_link('Delete')
      expect(page).to have_content(@tp_1.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
      expect(page).to have_content(@tp_2.name)
      expect(page).to have_content(@tp_2.created_at.in_time_zone("America/Denver").strftime("Created on %m/%d/%Y at %I:%M%p %Z"))
      expect(page).to have_link("New Theme Park", href: '/themeparks/new')
    end

    it 'changes view when sort by number of rides is clicks' do
      visit '/themeparks'

      expect(@tp_1.name).to appear_before(@tp_2.name)

      click_on "Sort by Number of Rides"

      expect(page).to have_content("Number of Rides")
      expect(@tp_2.name).to appear_before(@tp_1.name)
    end

    it "can search by keyword" do
      themepark_1 = create(:theme_park, name: "ThemePark")
      themepark_2 = create(:theme_park, name: "Other ThemePark")

      visit '/themeparks'
      fill_in 'Exact match', with: 'ThemePark'
      click_button 'Exact match'
      expect(page).to have_content(themepark_1.name)
      expect(page).to have_no_content(themepark_2.name)
    end

    it "can search by partial keyword" do
      themepark_1 = create(:theme_park, name: "ThemePark")
      themepark_2 = create(:theme_park, name: "Other ThemePark")
      themepark_3 = create(:theme_park, name: "Different")

      visit '/themeparks'
      fill_in 'Partial match', with: 'ThemePark'
      click_button 'Partial match'
      expect(page).to have_content(themepark_1.name)
      expect(page).to have_content(themepark_2.name)
      expect(page).to have_no_content(themepark_3.name)
    end

  end
end
