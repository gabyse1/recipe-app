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
