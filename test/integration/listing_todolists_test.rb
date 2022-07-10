require "test_helper"

class ListingTodolistsTest < ActionDispatch::IntegrationTest
  def setup 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    sign_in_as(@user)
    @todolist = Todolist.create(work: "test", user: @user)
    @todolist2 = Todolist.create(work: "test2", user: @user)
	end 
	
	test "should show todolist listing" do 
	  get '/todolists'
	  assert_select "a[href=?]", todolist_path(@todolist), text: "Show"
	  assert_select "a[href=?]", todolist_path(@todolist2), text: "Show"
	end 
end
