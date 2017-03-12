class AddDateTimePartySizeToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :date_time, :string, null: false
    add_column :reservations, :party_size, :integer, null: false
  end
end
