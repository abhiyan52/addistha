class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string "name"
      t.integer "manager_id"
      t.string "contact_number"
      t.string "email"
      t.timestamps
    end
  end
end
