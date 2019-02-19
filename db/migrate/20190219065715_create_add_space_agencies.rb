class CreateAddSpaceAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :add_space_agencies do |t|
      t.string "name"
      t.integer "manager_id"
      t.string "contact_number"
      t.string "email"

      t.timestamps
    end
    add_index "add_space_agencies", "manager_id"
  end
end
