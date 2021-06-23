json.extract! @recipe, :id, :name, :description, :instructions, :cuisine, :meal, :serves
json.reviews @recipe.reviews do |review|
  json.extract! review, :id, :description, :rating
end
