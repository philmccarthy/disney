class ThemePark < ApplicationRecord
  has_many :rides, dependent: :destroy

end