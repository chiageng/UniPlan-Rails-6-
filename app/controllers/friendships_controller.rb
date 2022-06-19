class FriendshipsController < ApplicationController
    def create 
        friend = User.find(params[:friend])
        current_user.friendships.build(friend_id: params[:friend])
        if current_user.save 
            flash[:success] = "Following user"
        else 
            flash[:danger] = "Unable to follow user"
        end 
        redirect_to friend
    end 

    def destroy 
        friend = User.find(params[:id])
        friendship = current_user.friendships.where(friend_id: params[:id]).first
        friendship.destroy 
        flash[:success] = "Unfollow user"
        redirect_to friend
    end 
end
