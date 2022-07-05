class ChatroomsController < ApplicationController
    before_action :require_user 
    before_action :all_chatrooms, only: [:index, :show]
    before_action :find_chatroom, only: [:show]
    before_action :require_participation, only: [:show]
    def index 
        @users = User.all_except(current_user) 
    end 

    
    def show
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

    def all_chatrooms 
        @chatrooms = current_user.chatrooms 
    end 

    def find_chatroom 
        @chatroom = Chatroom.find(params[:id])
    end 

    def require_participation
        checker = current_user.chatrooms.where(id: @chatroom.id).first
        if !checker 
            flash[:danger] = "You are not participate in the chatroom"
            redirect_to chatrooms_path
        end 
    end 

end
