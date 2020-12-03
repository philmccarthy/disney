class Resort < ApplicationRecord

  has_many :vacationers, dependent: :destroy
  
end
