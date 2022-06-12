class TimetablesController < ApplicationController
    before_action :timetable_find, only: [:destroy, :update, :edit, :show]
    before_action :require_user, only: [:index, :new, :create, :destroy, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    
    def index
        @todo = current_user.todolists.where(status: "In-progress")
        @days = [ "Mon", "Tue", "Wed", "Thurs", "Fri", "Sat", "Sun"]
        @times = ['8-10am', '10-12pm', '12-2pm', '2-4pm', '4-6pm', '6-8pm','8-10pm']
        if (params.has_key?(:category)) && params[:category] != "All"
            @works = current_user.timetables.where(category: params[:category])
        else 
            @works = current_user.timetables.all 
        end 
    end 

    def show 
    end 

    def new 
        @work = Timetable.new 
    end

    def create
        @work = Timetable.new(timetable_params)
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
        if @work.update(timetable_params)
            flash[:success] = "Your work is updated successfully"
            redirect_to @work 
        else 
            render "edit"
        end 
    end 

    def destroy
        @work.destroy
        redirect_to timetables_path
    end 

    private 
    def timetable_params 
        params.require(:timetable).permit(:day, :work, :starttime, :endtime, :category)
    end 

    def timetable_find 
        @work = Timetable.find(params[:id])
    end 

    def require_same_user
        if current_user != @work.user && !current_user.admin?
            flash[:danger] = "You cannot delete some other people work"
            redirect_to timetable_path
        end 
    end 
end
