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
    @bid.agent_id = User.find_by_username(session[:username]).agent.id  
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
