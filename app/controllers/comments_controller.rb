class CommentsController < ApplicationController
    before_action :find_forum
    before_action :require_user 
    before_action :find_comment, except: [:create]
    before_action :require_same_user, only: [:destroy]

    def create 
        @comment = @forum.comments.create(comment_params)
        @comment.user = current_user
        @comment.save
        redirect_to @forum
    end 

    def destroy
        @comment.destroy
        redirect_to @forum
    end

    private 
    def comment_params 
        params.require(:comment).permit(:comment)
    end 

    def find_forum
        @forum = Forum.find(params[:forum_id])
    end 

    def find_comment
        @comment = @forum.comments.find(params[:id])
    end 

    def require_same_user
        if current_user != @forum.user 
            flash[:danger] = "You cannot delete some other people comments"
            redirect_to @forum
        end 
    end 
end
