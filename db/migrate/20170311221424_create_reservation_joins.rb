class CreateReservationJoins < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_joins do |t|
      t.integer :reservation_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :reservation_joins, :user_id
    add_index :reservation_joins, :reservation_id
    add_index :reservation_joins, [:user_id, :reservation_id], unique: true
  end
end
