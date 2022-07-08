require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup 
    @chatroom = Chatroom.create() 
    @chatroom.save 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    @message = Message.create(chatroom: @chatroom, user: @user, body: "test")
  end 

  test "create new message" do 
    assert @message 
  end 
end
