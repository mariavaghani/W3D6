# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string
#  likeable_id   :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer          not null
#
class Like < ApplicationRecord
    validates_uniqueness_of :user_id, { scope: [:likeable_id, :likeable_type]}

    belongs_to :user
    belongs_to :likeable, polymorphic: true
end
