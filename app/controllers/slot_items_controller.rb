class SlotItemsController < ApplicationController
  def index
  	@advertisement_slots = AdvertisementSlot.where(status: 'onsale')
  end

  def show
  	@advertisement_slot = AdvertisementSlot.find_by_id(params[:id])
  end
  def create 
  	organization =  User.find_by_username(session[:username]).organization 
    advertisement_slot = AdvertisementSlot.find_by_id(params[:slot_id])
    puts params[:slot_id]
    advertisement_slot.update_attribute('organization_id', organization.id)
    advertisement_slot.update_attribute('status', 'sold')
    if advertisement_slot.save 
      flash[:success] =  "You have sucessfully purchased the slot"
    else 
      flash[:success] =  "Slot Purchase Failed"
    end
    redirect_to root_path()

  end

  def list
    @slots = User.find_by_username(session[:username]).organization.advertisement_slots
  end

  def agent_slots_list
    @agent_slots = User.find_by_username(session[:username]).agent.advertisement_slots

  end

  def agent_slots_edit

  end 
end
