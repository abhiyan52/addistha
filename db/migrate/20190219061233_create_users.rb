class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "username"
      t.string "password_digest"
      t.string "first_name", :null   => false
      t.string "last_name", :null  => false
      t.integer "contact_number", :null  => false
      t.string "email", :null=>false
      t.integer "user_type", :default => 0
      t.timestamps
    end
    add_index "users", "username", unique: true
  end
end
