class MessagesController < ApplicationController
    before_action :require_user 
    
    def create 
        @chatroom = Chatroom.find(params[:chatroom_id])
        @message = @chatroom.messages.create(message_params)
        @message.user = current_user 
        if @message.save 
            # redirect_to @chatroom
            ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(@message)
        end 
    end 

    private 
    def message_params
        params.require(:message).permit(:body)
    end 

    def message_render(message)
        render(partial: 'message', locals: {message: message})
    end 
end
