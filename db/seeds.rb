# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# rails g model User name:string
# rails g model Food name:string measurement_unit:string price:decimal{10-2} user:references:index
# rails g model Recipe name:string preparation_time:decimal{10-2} cooking_time:decimal{10-2} description:text public:boolean user:references:index
# rails g model RecipeFood quantity:decimal{10-2} recipe:references:index food:references:index
# rails g model Inventory name:string user:references:index
# rails g model InventoryFood quantity:decimal{10-2} inventory:references:index food:references:index

u1 = User.create(name: 'user1', email: 'user1@gmail.com', password: 'aaaaaa', confirmed_at: Time.now)
u2 = User.create(name: 'user2', email: 'user2@gmail.com', password: 'aaaaaa', confirmed_at: Time.now)

food1 = Food.create(name: 'food1', measurement_unit: 'kile', price: 2.5, user: u1)
food2 = Food.create(name: 'food2', measurement_unit: 'kile', price: 5.3, user: u1)
food3 = Food.create(name: 'food3', measurement_unit: 'kile', price: 3.0, user: u1)
food4 = Food.create(name: 'food4', measurement_unit: 'kile', price: 2.0, user: u2)
food5 = Food.create(name: 'food5', measurement_unit: 'kile', price: 1.5, user: u2)

rec1 = Recipe.create(name: 'recipe1', preparation_time: 1.5, cooking_time: 0.75, description: 'Recipe 1 steps', public: true, user: u1)
rec2 = Recipe.create(name: 'recipe2', preparation_time: 2, cooking_time: 1, description: 'Recipe 2 steps', public: false, user: u1)
rec3 = Recipe.create(name: 'recipe3', preparation_time: 2.5, cooking_time: 1.25, description: 'Recipe 3 steps', public: true, user: u2)

rf1 = RecipeFood.create(quantity: 2, recipe: rec1, food: food1)
rf2 = RecipeFood.create(quantity: 1.5, recipe: rec1, food: food2)
rf3 = RecipeFood.create(quantity: 5, recipe: rec1, food: food3)
rf4 = RecipeFood.create(quantity: 2.5, recipe: rec2, food: food1)
rf5 = RecipeFood.create(quantity: 6, recipe: rec2, food: food3)
rf6 = RecipeFood.create(quantity: 7, recipe: rec3, food: food4)
rf7 = RecipeFood.create(quantity: 3.25, recipe: rec3, food: food5)
