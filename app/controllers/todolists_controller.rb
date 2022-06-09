class TodolistsController < ApplicationController
    before_action :todolist_find, only: [:destroy, :update, :edit, :show]
    before_action :require_user, only: [:index, :new, :create, :destroy, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
        @works = Todolist.all 
        # if current_user
        #     @works_filter = current_user.todolists
        # end 
    end 

    def show 
    end 

    def new 
        @work = Todolist.new 
    end

    def create
        @work = Todolist.new(todolist_params)
        @work.user = current_user
        if @work.save 
            flash[:success] = "Work was created successfully"
            redirect_to @work
        else 
            render "new"
        end 
    end 

    def edit
    end 

    def update 
        if @work.update(todolist_params)
            flash[:success] = "Your work is updated successfully"
            redirect_to @work 
        else 
            render "edit"
        end 
    end 

    def destroy
        @work.destroy
        redirect_to todolists_path
    end 

    private 
    def todolist_params 
        params.require(:todolist).permit(:work, :priority)
    end 

    def todolist_find 
        @work = Todolist.find(params[:id])
    end 

    def require_same_user
        if current_user != @work.user && !current_user.admin?
            flash[:danger] = "You cannot delete some other people work"
            redirect_to todolists_path
        end 
    end 
end
