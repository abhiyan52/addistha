class CreateAdvertisementSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisement_slots do |t|
      t.integer "agent_id", :null => false 
      t.integer "organization_id", :null => true, :default => nil 
      t.integer "advertisement_id", :null => false
      t.integer "selling_price", :null => true, :default => 0 
      t.integer "buying_price", :null => false   
	  t.string "status", :default => "onsale"
	  t.timestamps
    end
    add_index("advertisement_slots", "agent_id")
    add_index("advertisement_slots", "organization_id")
    add_index("advertisement_slots", "advertisement_id")
  end
end
