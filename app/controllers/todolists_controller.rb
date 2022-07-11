class TodolistsController < ApplicationController
    before_action :todolist_find, only: [:destroy, :update, :edit, :show]
    before_action :require_user, only: [:index, :new, :create, :destroy, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
        # @works = Todolist.all 
        # if current_user
        #     @works_filter = current_user.todolists
        # end 
        @works = current_user.todolists 
        @works1 = current_user.todolists.where(status: "Pending")
        @works2 = current_user.todolists.where(status: "In-progress")
        @works3 = current_user.todolists.where(status: "Done")
    end 

    def show 
        if (params.has_key?(:status))
            if params[:status] == "In-progress"
                redirect_to edit_todolist_path(@work, status: "In-progress")
            else 
                @work.status = params[:status]
                @work.save
                flash[:sucess] = "Status of work updated"
                redirect_to todolists_path 
            end 
        end 
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
        if (params.has_key?(:status))
            if params[:status] == "In-progress"
                @work.status = "In-progress"
            end 
        end 
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
        flash[:danger] = "Your work has been deleted successfully"
        redirect_to todolists_path
    end 

    private 
    def todolist_params 
        params.require(:todolist).permit(:work, :priority, :status, :day, :starttime, :endtime)
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
