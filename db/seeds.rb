# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ThemePark.destroy_all
Ride.destroy_all
Resort.destroy_all
Vacationer.destroy_all

FactoryBot.create_list(:theme_park, 10)
ThemePark.all.each do |tp|
  rand(6..12).times do
    FactoryBot.create(:ride, theme_park: tp)
  end
end

FactoryBot.create_list(:resort, 10)
Resort.all.each do |res|
  rand(6..12).times do
    FactoryBot.create(:vacationer, resort: res)
  end
end