class Bid < ApplicationRecord
	belongs_to :agent 
	belongs_to :advertisement
	scope :highest, -> { order(:bid_amount).reverse_order.first.agent.name}
end
