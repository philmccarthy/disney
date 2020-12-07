FactoryBot.define do
  factory :theme_park do
    sequence(:name) { |n| "Name #{n}" }
    city { "Orlando" }
    open { [true, false].sample }
  end

  factory :ride do
    sequence(:name) { |n| "Ride #{n}" }
    sequence(:max_occupants) { |n| n + 22 }
    operational { [true, false].sample }
    theme_park
  end
end