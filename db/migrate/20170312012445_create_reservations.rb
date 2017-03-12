class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :rid, null: false
      t.string :confirmation_number, null: false
      t.integer :party_size, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
    end
  end
end
