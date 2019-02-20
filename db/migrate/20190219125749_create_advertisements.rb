class CreateAdvertisements < ActiveRecord::Migration[5.2]
  def change
    create_table :advertisements do |t|
      t.datetime "slot_start_time"
      t.datetime "slot_end_time"
      t.integer "agency_id"
      t.string "status"
      t.timestamps
    end
    add_index("advertisements", "agency_id")
  end
end
