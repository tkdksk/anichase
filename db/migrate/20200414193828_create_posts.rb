class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :name
      t.integer :reply_id
      t.references :anime, foreign_key: true
      t.references :member, foreign_key: true
      t.timestamps
    end
  end
end