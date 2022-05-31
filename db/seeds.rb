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

u1 = User.create(name: 'user1')
u2 = User.create(name: 'user2')

food1 = Food.create(name: 'food1', measurement_unit: 'kile', price: 2.5, user: u1)
food2 = Food.create(name: 'food2', measurement_unit: 'kile', price: 5.3, user: u1)
food3 = Food.create(name: 'food3', measurement_unit: 'kile', price: 3.0, user: u2)

inv1 = Inventory.create(name: 'inventory1', user: u1)
inv2 = Inventory.create(name: 'inventory2', user: u1)

if1 = InventoryFood.create(quantity: 2.5, inventory: inv1, food: food1)
if2 = InventoryFood.create(quantity: 5, inventory: inv1, food: food2)

rec1 = Recipe.create(name: 'recipe1', preparation_time: 1.5, cooking_time: 0.75, description: 'Recipe 1 steps', user: u1)
rec2 = Recipe.create(name: 'recipe2', preparation_time: 2, cooking_time: 1, description: 'Recipe 2 steps', user: u1)

rf1 = RecipeFood.create(quantity: 2, recipe: rec1, food: food1)
rf2 = RecipeFood.create(quantity: 1, recipe: rec1, food: food2)
