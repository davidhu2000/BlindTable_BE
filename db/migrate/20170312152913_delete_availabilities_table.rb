class DeleteAvailabilitiesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :availabilities
  end
end
