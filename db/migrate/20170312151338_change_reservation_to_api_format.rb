class ChangeReservationToApiFormat < ActiveRecord::Migration[5.0]
  def change
    remove_columns :reservations, :name, :address, :state, :city, :zip, :time
    add_column :reservations, :rid, :string, null: false
    add_column :reservations, :confirmation_number, :string, null: false
  end
end
