class Anime < ApplicationRecord
  has_many :posts,  dependent: :destroy
  has_many :schedule,  dependent: :destroy
  has_many :member, through: :posts
  has_many :favorites, dependent: :destroy
  has_many :fav_member, through: :favorites, source: :member

  has_one_attached :anime_picture
  attribute :new_anime_picture

  def self.search(search)
    return Anime.all unless search
    Anime.where(["title LIKE ?", "%#{search}%"])
  end

  before_save do
    if new_anime_picture
      self.anime_picture = new_anime_picture
    end
  end

  def favorite_by?(member)
    favorites.where(member_id: member.id).exists?
  end
end
