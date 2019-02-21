class Bid < ApplicationRecord
	belongs_to :agent 
	belongs_to :advertisement
	validate :validates_minimum_bid_amount
	scope :highest, -> (advertisment_id) { where('advertisement_id =?', advertisment_id).order(:bid_amount).reverse_order.first.agent.name}
	
	private 
	def validates_minimum_bid_amount
		if Bid.where('advertisement_id =?', self.advertisement_id).length > 0
			allowed_bid = Bid.where('advertisement_id =?', self.advertisement_id).order(:bid_amount).reverse_order.first.bid_amount
			puts '------------'
			puts self.advertisement_id
		else 				
			allowed_bid = Advertisement.find_by_id(self.advertisement_id).base_price 
		end
		if self.bid_amount < allowed_bid
			errors.add(:bid_amount, "Bid amount  should be greater than "+allowed_bid.to_s)
		end 
	end
end
