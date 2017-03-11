class ChangeAuthyIdToIntegerInUsersTable < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :authy_id, :string
  end
end
