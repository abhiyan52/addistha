class Agent < ApplicationRecord
	belongs_to :user,  :foreign_key => "manager_id" 
	has_many :bids
end
