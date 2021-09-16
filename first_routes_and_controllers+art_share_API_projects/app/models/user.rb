# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork

    has_many :shares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :shares,
        source: :artwork

    has_many :comments,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Comment,
        dependent: :destroy

    has_many :likes,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Like,
        dependent: :destroy

    has_many :liked_artworks,
        through: :likes,
        source: :likeable,
        source_type: :Artwork

    has_many :liked_comments,
        through: :likes,
        source: :likeable,
        source_type: :Comment

    def favorited_artworks
        self.artworks.select {|artwork| artwork.favorite}
    end

    def favorited_shared_artworks
        self.shared_artworks.select {|artwork| artwork.favorite}
    end
end
