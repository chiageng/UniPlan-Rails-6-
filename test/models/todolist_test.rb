require "test_helper"

class TodolistTest < ActiveSupport::TestCase
  def setup 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    @todolist = Todolist.create(work: "test", user: @user)
  end

  test "create new todolist work" do
    assert @todolist.valid? 
  end 

  test "work name should be present" do 
    @todolist.work = " "
    assert_not @todolist.valid? 
  end 

  test "todolist have to belongs to a user" do 
    @todolist2 = Todolist.create(work: "test")
    assert_not @todolist2.valid? 
  end 
end
