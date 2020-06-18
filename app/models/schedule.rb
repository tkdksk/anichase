class Schedule < ApplicationRecord
  belongs_to :anime, optional: true
  default_scope -> { order(start_time: :asc) }
end