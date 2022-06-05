# This will guess the Recipe class
FactoryBot.define do
  factory :recipe do
    name { 'test recipe' }
    preparation_time { 1.25 }
    cooking_time { 0.3 }
    description { 'test recipe cooking steps' }
    public { true }
    user
  end
end
