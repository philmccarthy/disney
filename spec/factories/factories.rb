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

  factory :resort do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:amount_of_rooms) { |n| n + 50}
    vacancy { [true, false].sample }
  end

  factory :vacationer do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
    checked_in { [true, false].sample}
    resort
  end
end
