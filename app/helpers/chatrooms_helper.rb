module ChatroomsHelper
    def chatroom_name(chatroom, current_user)
        chatroom.users.each do |user|
            if user != current_user
                return user.username 
            end 
        end 
    end 
end
