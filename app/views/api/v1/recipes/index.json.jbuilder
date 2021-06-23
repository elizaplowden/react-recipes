json.array! @recipes do |recipe|
  json.extract! recipe, :id, :name, :description, :instructions, :cuisine, :meal, :serves
end
