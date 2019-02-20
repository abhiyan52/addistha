 class IndexController < ApplicationController
    def index
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
            flash[:success] = "You have been sucessfully registered"
            redirect_to(root_path())
        else 
            u.errors.full_messages.each do |error|
                flash[:danger] = error
            end
           flash[:danger] = error
           redirect_to(signup_path())
        end
    end   
end
end
