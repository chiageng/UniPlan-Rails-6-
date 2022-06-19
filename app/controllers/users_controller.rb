class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update, :destroy, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            flash[:primary] = "Registration successful. Login to your account now!"
            redirect_to login_path
        else 
            flash[:danger] = @user.errors.full_messages
            redirect_to signup_path
        end 
    end 

    def index 
        @users = User.all
    end 

    def show 
        @work = @user.todolists 
    end 

    def edit
    end 

    def update 
        if @user.update(user_params)
            flash[:success] = "Your account has been updated successfully"
            redirect_to @user
        else 
            render "new"
        end 
    end 

    def destroy 
        @user.destroy 
        flash[:success] = "Your account has been deleted successfully"
        if @user == current_user
            session[:user_id] = nil 
            redirect_to root_path
        else 
            redirect_to users_path
        end 
    end 

    private 
    def user_params 
        params.require(:user).permit(:username, :email, :password, :job, :fullname, :phone, :address, :website, :github, :twitter, :instagram, :facebook, category_ids:[])
    end 

    def find_user
        @user = User.find(params[:id])
    end 

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:danger] = "You cannot edit other people account"
            redirect_to user_path(current_user)
        end 
    end 

    def require_admin 
        if !current_user.admin? 
            flash[:danger] = "Only admin can access this page"
            redirect_to user_path(current_user)
        end 
    end 
end
