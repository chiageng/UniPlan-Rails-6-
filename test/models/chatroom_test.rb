require "test_helper"

class ChatroomTest < ActiveSupport::TestCase
  test "create new chatroom" do 
    @chatroom = Chatroom.create()
    assert @chatroom.valid?
  end 
end
