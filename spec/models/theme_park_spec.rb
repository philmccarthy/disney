require 'rails_helper'

RSpec.describe ThemePark, type: :model do
  describe 'relationships' do
    it {should have_many :rides}
  end

  describe 'class methods' do
    describe '::sort_by_ride_count' do
      it 'orders by ride count' do
        tp_1 = create(:theme_park)
        tp_2 = create(:theme_park)
        create_list(:ride, 5, theme_park: tp_1)
        create_list(:ride, 10, theme_park: tp_2)
        
        expect(ThemePark.all.first).to eq(tp_1)
        expect(ThemePark.sort_by_ride_count.first).to eq(tp_2)
      end
    end
    describe '::default_order' do
      it 'orders by open then most recently created' do
        tp_1 = create(:theme_park, open: true)
        tp_2 = create(:theme_park, open: false)
        tp_3 = create(:theme_park, open: true)
        tp_4 = create(:theme_park, open: false)
        
        expect(ThemePark.default_order).to eq([tp_3, tp_1, tp_4, tp_2])
      end
    end
  end
end