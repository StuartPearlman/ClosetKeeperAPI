# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: 'fake@bc.net', password_digest: 'faker')
Outfit.create(user_id: 1, date_worn: Time.now)
Item.create(user_id: 1)
OutfitItem.create(outfit_id: 1, item_id:1)