class Post < ApplicationRecord
  belongs_to :anime, optional: true
  belongs_to :member, optional: true

  def self.search(search)
    Post.find_by(id: search)
  end
end
