class AdvertisementsController < ApplicationController
  def index
    @advertisements = User.find_by_username(session[:username]).agency.advertisements
  end

  def new
    @advertisement = Advertisement.new
    @advertisement.agency_id = User.find_by_username(session[:username]).agency.id
  end

  def create
    if request.method == 'POST'
      @advertisement = Advertisement.new(params.require(:advertisement).permit(:slot_start_time, :slot_end_time, :agency_id, :status, :bid_end_time, :base_price))
      if @advertisement.status == "bidding"
        @advertisement.bid_start_time = Time.now
      end

      if @advertisement.save
        flash[:success] = "New slot created #{@advertisement.slot_start_time} - #{@advertisement.slot_end_time} "
        redirect_to root_path()
      else
         @advertisement.errors.full_messages.each do |message|
            flash[:danger] = "Sorry slot cannot be created" 
         end 
        redirect_to new_advertisement_path()
      end 
    end 
  end

  def delete
    advertisement = Advertisement.find_by_id(params[:id])
    if !advertisement.agency.manager_id == User.find_by_username(session[:username]).id 
      render :inline => "403 Forbidden"
    else
      advertisement.destroy
      flash[:success] = "Deleted Sucessfully"
      redirect_to advertisements_path()
    end 
  end

  def edit
  @advertisement = Advertisement.find_by_id(params[:id])
  if !@advertisement.agency.manager_id == User.find_by_username(session[:username]).id
    render :inline => "Not allowed"
  end
  end

  def update
    advertisement = Advertisement.find_by_id(params[:id])
    advertisement.update_attributes(params.require("advertisement").permit(:slot_start_time, :slot_end_time))
    if advertisement.save 
      flash[:success] = "Sucessfully Updated!"
    else 
    @advertisement.errors.full_messages.each do |message|
            flash[:danger] = message 
    end 
    redirect_to edit_advertisement_path()
    end
  end

  def show
    @advertisement = Advertisement.find_by_id(params[:id])
    @bids = Bid.where(advertisement_id: params[:id])
  end
  
  def sell 
    advertisement = Advertisement.find_by_id(params[:id])
    
    if advertisement
      bid_info = Bid.where("advertisement_id = ?", advertisement.id).order(:bid_amount).reverse_order.first
      if bid_info 
        advertisement_slot = AdvertisementSlot.new(:agent_id => bid_info.agent_id, :advertisement_id => params[:id], :buying_price => bid_info.bid_amount)
        if advertisement_slot.save 
          flash[:sucess] = "The slot has been sucessfully sold to #{advertisement_slot.agent.name} for ${advertisement_slot.buying_price}"
          advertisement.update_attribute('status', 'sold')
          advertisement.save
        else 
           advertisement_slot.errors.full_messages.each do |message|
              flash[:danger] = message

           end 
        end

      else 
       flash[:danger] = "The Bid Was unsucessful!!"
      end
      redirect_to advertisements_path(advertisement.id) 
    end  
end 

end
