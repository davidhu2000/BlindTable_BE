class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :image_url, null: false
      t.text :description, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :phone_number, null: false
      t.string :session_token, null: false
      t.string :authy_id, null: false

      t.timestamps
    end
    add_index :users, :session_token
    add_index :users, :authy_id
    add_index :users, :phone_number, unique: true
  end
end
