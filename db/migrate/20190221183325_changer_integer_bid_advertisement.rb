class ChangerIntegerBidAdvertisement < ActiveRecord::Migration[5.2]
  def change
  	  	change_column "bids", "advertisement_id" , 'integer USING CAST(advertisement_id AS integer)'

  end
end
