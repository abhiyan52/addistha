 class IndexController < ApplicationController
    def index
        @advertisements = Advertisement.where("bid_end_time > ? " , Time.now).where(:status => "bidding")
    end
    def profile 
     @user = User.find_by_username(session[:username])

    end 
    def login
     if request.method == 'POST'
        if params[:username].nil? or params[:password].nil?
            render :inline => "Password cannot be blank"
        else
            u = User.find_by_username(params[:username])
            if !u.nil? && u.authenticate(params[:password])
                session[:username] = u.username 
                session[:user_type] = u.user_type
                redirect_to(root_path())
            else 
                flash[:danger] = "Sorry wrong username or password"
                redirect_to(login_path())
            end
        end
     end
    end

    def logout 
        session[:user_type] = nil
        session[:username] = nil
        flash[:success] = "You have been loggedout"
        redirect_to(root_path())
    end

    def signup
      if request.method == 'POST'
        u = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password,:contact_number,:username,:user_type))
        if u.save
            flash[:success] = "You have been sucessfully registered.. Please give your company detail"
            redirect_to(:controller => "index", :action => "extrainfo", :id => u.id)
        else 
            u.errors.full_messages.each do |error|
                flash[:danger] = error
            end
        redirect_to(:controller => "index", :action => "signup")
        end
    end

       
    end
   def extrainfo
        if request.method == 'POST'
            user_type  = User.find_by_id(params[:user_id]).user_type
            if user_type == 0
                company = Organization
            elsif  user_type == 1
                company = Agent 
            else 
                company = Agency 
            end 
            com = company.new(params.require(:company).permit(:name, :email, :contact_number))
            com.manager_id = params[:user_id] 
            if com.save 
                flash[:success] = "Your Company has been created"
                redirect_to(root_path)
            else 
                com.errors.full_messages.each do |message|
                    flash[:danger] = message
                end
                redirect_to(root_path)
            end 
        else 
            render "index/info"
        end   
    end
end
