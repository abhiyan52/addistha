class ChangeLimitInteger < ActiveRecord::Migration[5.2]
  def change
  	change_column "users", "contact_number", :string
  	change_column "agents", "contact_number", :string
  	change_column "agencies", "contact_number", :string
  	change_column "organizations", "contact_number", :string
  end
end
