class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :title, null: false
      t.string :official
      t.timestamps
    end
  end
end
