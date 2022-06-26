class ChatroomsController < ApplicationController
    before_action :require_user 
    def index 
        @chatrooms = Chatroom.all 
        @users = User.all_except(current_user) 
    end 

    
    def show
        @chatroom = Chatroom.find(params[:id])
        @messages = @chatroom.messages
        render 'index'
    end 

    def new 
        @chatroom = Chatroom.new 
    end 

    def create 
        @chatroom = Chatroom.new(chatroom_params)
        if @chatroom.save 
            flash[:success] = "A new chatroom is created successfully"
            redirect_to @chatroom
        else 
            flash[:danger] = "Chatroom create is unsuccessfull"
            render "new"
        end 
    end 

    private
    def chatroom_params
        params.require(:chatroom).permit(:name)
    end
end
