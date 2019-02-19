class CreateAddBids < ActiveRecord::Migration[5.2]
  def change
    create_table :add_bids do |t|
      t.integer "slot_id"
      t.integer "starting_bid_amount"
      t.integer "closing_bid_amount", :null=>true
      t.integer "current_bid_amount"
      t.integer "agent_id"
      t.datetime "closing_time"
      t.datetime "start_time"
      t.timestamps
    end
    add_index("add_bids", "slot_id")
    add_index("add_bids", "agent_id")
  end
end
