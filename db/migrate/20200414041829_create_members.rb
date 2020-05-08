class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :hashed_password
      t.boolean :administrator, null: false, default: false

      t.timestamps
    end
    
    add_index :members, "LOWER(email)", unique: true
  end
end
