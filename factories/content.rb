require 'faker'

FactoryBot.define do
  factory :content do
    title { Faker::Pokemon.name }
    director { Faker::Name.name }
    year { Faker::Date.between_except(10.year.ago, 1.year.from_now, Date.today).year }
    category { Faker::Music.genre }
    file_path { Faker::Internet.url }
  end
end
