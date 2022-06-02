class SessionsController < ApplicationController
    def new
    end 

    def create 
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id 
            flash.now[:success] = "You have login successfully"
            redirect_to user_path(user)
        else 
            flash.now[:danger] = "Your email and password are incorrect"
            render "new"
        end 
    end 

    def destroy 
        session[:user_id] = nil 
        flash[:success] = "You have logged out successfully"
        redirect_to root_path
    end 
end
