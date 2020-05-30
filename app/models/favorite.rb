class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :anime
  validates :member_id, uniqueness: { scope: :anime_id }
end
