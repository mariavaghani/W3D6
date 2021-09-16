# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  artwork_id :integer          not null
#  body       :text             not null
#
class Comment < ApplicationRecord

    belongs_to :user
    belongs_to :artwork
end
