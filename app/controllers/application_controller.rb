class ApplicationController < ActionController::Base
before_action :check_for_time_end
private
def check_for_time_end
 advertisements = Advertisement.where(status: 'bidding').where("bid_end_time < ?", Time.now.to_s)
 advertisements.each do |advertisement|
 	advertisement.update_attribute('status', 'stopped')
 	puts advertisement.errors.full_messages
 end 
end
end
