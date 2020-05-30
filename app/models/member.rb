class Member < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :animes, through: :posts
  has_many :favorites, dependent: :destroy
  has_many :fav_animes, through: :favorites, source: :anime

  include StringNormalizer

  before_validation do
    self.name = normalize_as_text(name)
    self.email = normalize_as_email(email)
  end

  validates :name, presence: true
  validates :email, presence: true, "valid_email_2/email": true,
    uniqueness: { case_sensitive: false }

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def self.search(search)
    return Member.all unless search
    Member.where(["name LIKE ?", "%#{search}%"])
  end
end
