# This will guess the Food class
FactoryBot.define do
  factory :food do
    name { 'test food' }
    measurement_unit { 'Kiles' }
    price { 2.5 }
    user
  end
end
