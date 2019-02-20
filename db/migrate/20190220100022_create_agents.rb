class CreateAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :agents do |t|
      t.string "name"
      t.string "email"
      t.string "contact_number"
      t.integer "manager_id"

      t.timestamps
    end
   add_index("agents", "manager_id")
  end
end
