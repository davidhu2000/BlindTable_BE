class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :state, null: false
      t.string :city, null: false
      t.string :zip, null: false
      t.time :time, null: false

      t.timestamps
    end
  end
end
