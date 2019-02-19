class CreateAddSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :add_slots do |t|
      t.datetime "slot_end_time"
      t.integer "agency_id"
      t.string "status"
      t.timestamps
    end
    add_index "add_slots", "agency_id"
  end
end
