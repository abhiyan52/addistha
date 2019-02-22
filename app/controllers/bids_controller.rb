class BidsController < ApplicationController
  def index
  end

  def show
  end

  def delete
  end

  def update
  end

  def edit
  end

  def new
    @bid =Bid.new
    @bid.advertisement_id =params[:advertisement_id]
    @advertisement = Advertisement.find_by_id(params[:advertisement_id])
    @bid.agent_id = User.find_by_username(session[:username]).agent.id
    @new_bid = true 
    if Bid.where("advertisement_id = ?", params[:advertisement_id]).where("agent_id = ?", @bid.agent_id).length > 0 
      @new_bid = false 
    end  
  end 

  def create
    bid = Bid.new(params.require(:bid).permit(:bid_amount, :agent_id , :advertisement_id))
    
    if bid.save
      flash[:success] = "Your bid has been recorded"
    else
      bid.errors.full_messages.each  do |message| 
        flash[:danger] = message 
      end
    end
    redirect_to root_path() 
  end 
end
