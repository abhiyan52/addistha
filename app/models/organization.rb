class Organization < ApplicationRecord
	belongs_to :user,  :foreign_key => "manager_id" 
	has_many :advertisement_slots
end
