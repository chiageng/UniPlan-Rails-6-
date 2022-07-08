require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
  end

  test "create new user" do
    assert @user.valid? 
  end 

  test "username should be present" do 
    @user.username = " "
    assert_not @user.valid? 
  end 

  test "username should be unique" do 
    @user.save 
    @user2 = User.create(username: "test", email: "test@example.com", password: "test")
    assert_not @user2.valid? 
  end 

  test "email should be present" do 
    @user.email = " "
    assert_not @user.valid? 
  end 
  
  test "email format should be correct" do 
    @user.email = "test"
    assert_not @user.valid? 
  end 

end
