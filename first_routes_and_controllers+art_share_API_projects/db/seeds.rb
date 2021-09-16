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

ArtworkShare.destroy_all

art_share1 = ArtworkShare.create!(viewer_id: elliot.id, artwork_id:art1.id)
art_share2 = ArtworkShare.create!(viewer_id: dean.id, artwork_id:art3.id)
art_share3 = ArtworkShare.create!(viewer_id: angela.id, artwork_id:art6.id)
art_share4 = ArtworkShare.create!(viewer_id: charlos.id, artwork_id:art1.id)
art_share5 = ArtworkShare.create!(viewer_id: ryan.id, artwork_id:art1.id)


Comment.destroy_all

comm1 = Comment.create!(user_id: elliot.id, artwork_id:art1.id, body: "Pretty cool")
comm2 = Comment.create!(user_id: dean.id, artwork_id:art3.id, body: "meh")
comm3 = Comment.create!(user_id: angela.id, artwork_id:art1.id, body: "I could do better")
comm4 = Comment.create!(user_id: elliot.id, artwork_id:art2.id, body: "Never seen anything better")
comm5 = Comment.create!(user_id: charlos.id, artwork_id:art4.id, body: "blew my mind!!!")

Like.destroy_all

like1 = Like.create!(user_id: elliot.id, likeable_id: art1.id, likeable_type: :Artwork)
like2 = Like.create!(user_id: dean.id, likeable_id: art2.id, likeable_type: :Artwork)
like3 = Like.create!(user_id: ryan.id, likeable_id: comm1.id, likeable_type: :Comment)
like4 = Like.create!(user_id: ryan.id, likeable_id: comm2.id, likeable_type: :Comment)
like5 = Like.create!(user_id: angela.id, likeable_id: comm1.id, likeable_type: :Comment)
like6 = Like.create!(user_id: charlos.id, likeable_id: art5.id, likeable_type: :Artwork)
like7 = Like.create!(user_id: angela.id, likeable_id: art4.id, likeable_type: :Artwork)
like8 = Like.create!(user_id: charlos.id, likeable_id: comm3.id, likeable_type: :Comment)
like9 = Like.create!(user_id: elliot.id, likeable_id: comm5.id, likeable_type: :Comment)

