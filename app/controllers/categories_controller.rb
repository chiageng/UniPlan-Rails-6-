class CategoriesController < ApplicationController
    before_action :find_category, only: [:show, :edit, :update, :destroy]
    before_action :require_user
    before_action :require_admin

    def new 
        @category = Category.new 
    end 

    def create 
        @category = Category.new(category_params)
        if @category.save 
            flash[:primary] = "The category has been created successfully"
            redirect_to categories_path
        else 
            flash[:danger] = "Something wrong with the creation"
            render "new"
        end 
    end 

    def index 
        @categories = Category.all
    end 

    def show 

    end 

    def edit
    end 

    def update 
        if @category.update(category_params)
            flash[:success] = "The category has been updated successfully"
            redirect_to categories_path
        else 
            render "new"
        end 
    end 

    def destroy 
        @category.destroy 
        flash[:success] = "The category has been deleted successfully"
        redirect_to categories_path
    end 

    private 
    def category_params 
        params.require(:category).permit(:category)
    end 

    def find_category
        @category = Category.find(params[:id])
    end 

    def require_admin 
        if !current_user.admin? 
            flash[:danger] = "Only admin can access this page"
            redirect_to catogories_path
        end 
    end 
end
