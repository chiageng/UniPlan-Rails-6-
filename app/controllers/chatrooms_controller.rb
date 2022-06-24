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
        respond_to do |format|
            if @chatroom.save
                format.html { redirect_to chatroom_url(@chatroom), notice: "Chatroom was successfully created." }
                format.json { render :show, status: :created, location: @chatroom }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @chatroom.errors, status: :unprocessable_entity }
            end
        end
    end 

    def update
        @chatroom = Chatroom.find(params[:id])
        respond_to do |format|
          if @chatroom.update(chatroom_params)
            format.html { redirect_to chatroom_url(@chatroom), notice: "Chatroom was successfully updated." }
            format.json { render :show, status: :ok, location: @chatroom }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @chatroom.errors, status: :unprocessable_entity }
          end
        end
      end

    def destroy
        @chatroom = Chatroom.find(params[:id])
        @chatroom.destroy

        respond_to do |format|
          format.html { redirect_to chatrooms_url, notice: "Chatroom was successfully destroyed." }
          format.json { head :no_content }
        end
      end

    private

     def set_chatroom
      @chatroom = Chatroom.find(params[:id])
      @chatrooms = Chatroom.all 

      rescue ActiveRecord::RecordNotFound
        redirect_to(chatrooms_url, :notice => 'Chat not found')
     end

        def chatroom_params
            params.require(:chatroom).permit(:name)
    end
end
