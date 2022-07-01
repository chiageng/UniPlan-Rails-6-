class ForumsController < ApplicationController
    before_action :forum_find, only: [:destroy, :update, :edit, :show]
    before_action :require_user, only: [:new, :create, :destroy, :edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def index
        @forums = Forum.all 
        @relations = ForumCategory.all 
        if params.has_key?(:category) && params[:category] != "All"
            @category = Category.where(category: params[:category]).first
            @id = @category.id 
            @forums_id = ForumCategory.where(category_id: @id).map {
                |relation| relation.forum_id
            }
            @forums = Forum.find(@forums_id)
        end 
    end 

    def new 
        @forum = Forum.new 
    end 

    def create 
        @forum = Forum.new(forum_params)
        @forum.user = current_user
        if @forum.save 
            flash[:success] = "A new forum is created successfully"
            redirect_to @forum
        else 
            flash[:danger] = "Forum create is unsuccessfull"
            render "new"
        end 
    end 

    def show
    end 

    def edit
    end 

    def update
        if @forum.update(forum_params)
            flash[:success] = "Your forum has been updated successfully"
            redirect_to @forum 
        else 
            flash[:danger] = "Your forum edited failed"
            render "edit"
        end 
    end 

    def destroy 
        @forum.destroy 
        flash[:danger] = "Your forum has been deleted successfully"
        redirect_to forums_path
    end 

    def search 
        if params[:forum].present?
            @forums = Forum.search(params[:forum])
            render 'forums/index'
        else 
            flash[:danger] = "Please enter something to search"
            redirect_to forums_path
        end 
    end 


    private 
    def forum_params
        params.require(:forum).permit(:topic, :description,category_ids: [])
    end 

    def forum_find 
        @forum = Forum.find(params[:id])
    end 

    def require_same_user
        if current_user != @forum.user && !current_user.admin?
            flash[:danger] = "You cannot delete some other people's forum"
            redirect_to forums_path
        end 
    end 
end
