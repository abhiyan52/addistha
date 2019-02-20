
class Advertisement < ApplicationRecord
    belongs_to :agency
    validates_presence_of  :slot_start_time
    validates_presence_of  :slot_end_time
	def slot_duration
		return ((self.slot_end_time - self.slot_start_time)/60).to_i
	end     
 end
