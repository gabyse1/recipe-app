# This will guess the User class
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test.user.#{n}@gmail.com" }
    password { 'test.password' }
    name { 'test user name' }
    confirmed_at { Time.now }
  end
end
