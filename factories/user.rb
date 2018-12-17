require 'faker'

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Devise.friendly_token[0, 20] }
    username { Faker::Name.name }
    credit_card_number { Faker::Bank.account_number }
    next_payment { Faker::Time.between(2.days.ago, Date.today, :all) }
    is_manager { false }
  end

  factory :manager do
    email { Faker::Internet.email }
    password { Devise.friendly_token[0, 20] }
    username { Faker::Name.name }
    credit_card_number { Faker::Bank.account_number }
    next_payment { Faker::Time.between(2.days.ago, Date.today, :all) }
    is_manager { true }
  end
end
