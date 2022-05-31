# This will guess the User class
FactoryBot.define do
  factory :user do
    name { 'test user' }
    email { 'test.user@gmail.com' }
    password { 'password' }
    confirmed_at { Time.now }
  end
end
