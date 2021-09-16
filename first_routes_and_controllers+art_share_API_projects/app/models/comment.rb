# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  artwoqqurk_id :integer          not null
#  body       :text             not null
#
class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :artwork
    has_many :likes, as: :likeable

end
