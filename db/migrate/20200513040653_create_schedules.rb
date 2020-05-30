class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :start_time, null: false
      t.references :anime, foreign_key: true
      t.string :broadcaster, null: false
    end
  end
end