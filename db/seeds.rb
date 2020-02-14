require 'json'
require 'open-uri'
puts "Destroying existing database..."
Ingredient.destroy_all if Rails.env.development?
puts "Creating new ingredients..."
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  new_ingredient = Ingredient.new(
    name: ingredient["strIngredient1"]
  )
  new_ingredient.save!
  puts "#{new_ingredient.name} created!"
end
puts "All ingredients created!"


