class MessagesController < ApplicationController
    before_action :require_user 

    def index
      @messages = Message.all
    end

    def show
    end

    def new
     @message = Message.new
    end

    def edit
    end
    
    def create 
        @chatroom = Chatroom.find(params[:chatroom_id])
        @message = @chatroom.messages.create(message_params)
        @message.user = current_user 
        if @message.save 
            # redirect_to @chatroom
            ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(@message), id: @chatroom.id
        end 
    end 

    private 
        def message_params
            params.require(:message).permit(:body)
        end 

        def message_render(message)
            render(partial: 'message', locals: {message: message})
        end 

        def set_message
          @message = Message.find(params[:id])
        end
end
