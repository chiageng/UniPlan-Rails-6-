class ChatroomsController < ApplicationController
    before_action :require_user 
    def index 
        @chatrooms = Chatroom.all 
        @users = User.all_except(current_user) 
    end 

    
    def show
        @chatroom = Chatroom.find(params[:id])
        @messages = @chatroom.messages
    end 
end
