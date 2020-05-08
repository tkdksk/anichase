class Anime < ApplicationRecord
  has_many :posts,  dependent: :destroy
  has_many :member, through: :posts

  has_one_attached :anime_picture
  attribute :new_anime_picture

  def self.search(search)
    return Anime.all unless search
    Anime.where(["anime_title LIKE ?", "%#{search}%"])
  end

  before_save do
    if new_anime_picture
      self.anime_picture = new_anime_picture
    end
  end
end
