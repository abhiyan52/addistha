class SlotItemsController < ApplicationController
  def index
  	@advertisement_slots = AdvertisementSlot.where(status: 'onsale')
  end

  def show
  	@advertisement_slot = AdvertisementSlot.find_by_id(params[:id])
  end
  def create 
  	organization =  Organization.find_by_ session[:username]

  end

  def list
  end
end
