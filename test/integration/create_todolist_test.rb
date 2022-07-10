require "test_helper"

class CreateTodolistTest < ActionDispatch::IntegrationTest
  setup do 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    @todolist = Todolist.create(work: "test", user: @user)
  end 

  test "get new todolist form and create todolist" do
    sign_in_as(@user)
	  get "/todolists/new"
	  assert_response :success
	  assert_difference 'Todolist.count', 1 do 
	    post todolists_path, params: { todolist: { work: "test" } }
	    assert_response :redirect
	  end
	  follow_redirect!
	  assert_response :success
	  assert_match "test", response.body
	end 

  test "get new todolist form and reject invalid submission" do
    sign_in_as(@user)
	  get "/timetables/new"
	  assert_response :success
	  assert_no_difference 'Todolist.count' do 
	    post todolists_path, params: { todolist: { work: "" } }
	  end
	  assert_match "errors", response.body
	end 

  test "get new todolist form without login send back invalid submission" do
	  get "/todolists/new"
	  assert_response :redirect
	  follow_redirect!
	  assert_response :success
	  assert_match "login", response.body
	end 
end
