class AddColumnAdvertisement < ActiveRecord::Migration[5.2]
  def change
  	add_column("advertisements", "base_price", :integer)
  	change_column("advertisements","status", :string, :default=>"idle")
	end
end
