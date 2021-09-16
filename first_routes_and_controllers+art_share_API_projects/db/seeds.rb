# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
  
  # Instructors
elliot = User.create!(username: "all_knowing_elliot")
ryan = User.create!(username: "will_climb_rocks")
dean = User.create!(username: "dean_machine")
angela = User.create!(username: "loves_capy")
charlos = User.create!(username: "charlos_gets_buckets")

Artwork.destroy_all

art1 = Artwork.create!(title: "title1", image_url: 'default', artist_id: elliot.id)
art2 = Artwork.create!(title: "title2", image_url: 'default', artist_id: elliot.id)
art3 = Artwork.create!(title: "title3", image_url: 'default', artist_id: dean.id)
art4 = Artwork.create!(title: "title4", image_url: 'default', artist_id: angela.id)
art5 = Artwork.create!(title: "title5", image_url: 'default', artist_id: charlos.id)
art6 = Artwork.create!(title: "title6", image_url: 'default', artist_id: elliot.id)