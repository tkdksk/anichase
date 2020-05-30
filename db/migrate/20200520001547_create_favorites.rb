class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :member, null: false, foreign_key: true
      t.references :anime, null: false, foreign_key: true
      t.index [:member_id, :anime_id], unique: true

      t.timestamps
    end
  end
end
