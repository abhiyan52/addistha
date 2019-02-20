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
      @advertisement = Advertisement.new(params.require(:advertisement).permit(:slot_start_time, :slot_end_time, :agency_id))
      if @advertisement.save
        flash[:success] = "New slot created #{@advertisement.slot_start_time} - #{@advertisement.slot_end_time} "
        redirect_to root_path()
      else
         @advertisement.errors.full_messages.each do |message|
            flash[:danger] = "Sorry slot cannot be created" 
         end 
        redirect new_advertisement_path()
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
    @bids = Bid.where(advertisement_id = params[:id])
  end

end
