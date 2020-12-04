require 'rails_helper'

RSpec.describe Resort, type: :model do
  describe 'relationships' do
    it {should have_many :vacationers}
  end

end
