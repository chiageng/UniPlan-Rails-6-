require "test_helper"

class ForumTest < ActiveSupport::TestCase
  def setup 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    @forum = Forum.create(topic: "test", description: "test", user: @user)
  end

  test "create new forum" do
    assert @forum.valid? 
  end 

  test "forum topic should be present" do 
    @forum.topic = " "
    assert_not @forum.valid? 
  end 

  test "forum description should be present" do 
    @forum.description = " "
    assert_not @forum.valid? 
  end 

  test "forum have to belongs to a user" do 
    @forum2 = Forum.create(topic: "test", description: "test")
    assert_not @forum2.valid? 
  end 
end
