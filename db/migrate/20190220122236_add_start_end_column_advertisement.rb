class AddStartEndColumnAdvertisement < ActiveRecord::Migration[5.2]
  def change
  	add_column("advertisements", "bid_start_time",:datetime)
  	add_column("advertisements", "bid_end_time",:datetime)
  end
end
