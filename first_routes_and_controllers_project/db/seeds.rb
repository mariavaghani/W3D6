# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
  
  # Instructors
elliot = User.create!(name: "all_knowing_elliot", email: "those_are_teef@aa.io")
ryan = User.create!(name: "will_climb_rocks", email: "boulderz@aa.io")
dean = User.create!(name: "dean_machine", email: "deans_diary@aa.io")
angela = User.create!(name: "loves_capy", email: "chosenone@aa.io")
charlos = User.create!(name: "charlos_gets_buckets", email: "ballin@aa.io")