class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.string "advertisement_id", :null => false 
      t.string "agent_id", :null => false 
      t.integer "bid_amount", :default => 0
	t.timestamps
    end
    add_index("bids", "advertisement_id")
    add_index("bids", "agent_id")
  end
end
