class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.integer :radius, null: false
      t.integer :party_size, null: false, default: 4
      t.integer :forward_minutes, null: false, default: 60
      t.integer :backward_minutes, null: false, default: 0
      t.string :start_date_tiime, null: false
      t.string :longitude, null: false
      t.string :latitude, null: false
      t.timestamps
    end
  end
end
