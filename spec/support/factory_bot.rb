require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    sequence(:username) {|n| "user#{n}" }
    password 'password'
    password_confirmation 'password'
  end

  factory :trail do
    sequence(:name) {|n| "trail#{n}" }
    sequence(:street) {|n| "#{n} Main Street" }
    sequence(:city) {|n| "Boston" }
    sequence(:state) {|n| "MA" }
    sequence(:length) {|n| "#{n}" }
  end
end
