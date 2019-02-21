class CreateAddAgents < ActiveRecord::Migration[5.2]
  def change
    create_table :add_agents do |t|
      t.string "name"`
      t.integer "manager_id"
      t.string "contact_number"
      t.string "email"
      t.timestamps
    end
    add_index "add_agents", "manager_id"
  end
end
