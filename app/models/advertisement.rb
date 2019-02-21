
class Advertisement < ApplicationRecord
    belongs_to :agency
    has_many :bids
    has_many :advertisement_slots
    validates_presence_of  :slot_start_time
    validates_presence_of  :slot_end_time
    validate :validates_overlapping_slots
    def slot_duration
		return ((self.slot_end_time - self.slot_start_time)/60).to_i
    end
    
    private 
    def validates_overlapping_slots
     slots = Advertisement.where("agency_id = ?", self.agency_id)
     slots.each do |slot|
       if (self.slot_start_time >= slot.slot_start_time && self.slot_start_time <= slot.slot_end_time) || (self.slot_start_time < slot.slot_start_time && self.slot_end_time >= slot.slot_start_time)   
            errors.add(:slot_end_time , "The slot is overlapped")
            break     
       end
     end 
    
    end
  end 

