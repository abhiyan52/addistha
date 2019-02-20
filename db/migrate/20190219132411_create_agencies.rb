class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :email
      t.integer :manager_id
      t.integer :contact_number
      t.timestamps
    end
    add_index("agencies", "manager_id")
  end
end
