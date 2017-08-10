json.partial! 'spa/shared/success'

json.data @dummies do |dummy|
  json.id dummy[:id]
  json.name dummy[:name]
end