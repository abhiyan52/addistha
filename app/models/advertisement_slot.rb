class AdvertisementSlot < ApplicationRecord
	belongs_to :organization ,:optional => true
	belongs_to :agent
	belongs_to :advertisement 
end
