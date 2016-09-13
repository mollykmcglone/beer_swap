categories = [
  [ "Beer"],
  [ "News"],
  [ "Members"],
  [ "Brewing"]
]

categories.each do |name|
  Category.create( name: name )
end
