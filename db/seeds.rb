# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bike.all.destroy_all
for @i in (1..10) do
  @bike = Bike.new
  @bike.name = "Bike " + @i.to_s
  @bike.description = "Bike description " + @i.to_s
  @bike.status = "Active"
  @bike.save
end


