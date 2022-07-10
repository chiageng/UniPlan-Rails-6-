require "test_helper"

class CreateForumTest < ActionDispatch::IntegrationTest
  setup do 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    @forum = Forum.create(topic: "test", description: "test")
  end 

  test "get new forum form and create forum" do
    sign_in_as(@user)
	  get "/forums/new"
	  assert_response :success
	  assert_difference 'Forum.count', 1 do 
	    post forums_path, params: { forum: { topic: "Maths", description: "math discussion here" } }
	    assert_response :redirect
	  end
	  follow_redirect!
	  assert_response :success
	  assert_match "Maths", response.body
	end 

  test "get new forum form and reject invalid submission" do
    sign_in_as(@user)
	  get "/forums/new"
	  assert_response :success
	  assert_no_difference 'Forum.count' do 
	    post forums_path, params: { forum: { topic: "", description: "math discussion here" } }
	  end
	  assert_match "errors", response.body
	end 

  test "get new forum form without login send back invalid submission" do
	  get "/forums/new"
	  assert_response :redirect
	  follow_redirect!
	  assert_response :success
	  assert_match "login", response.body
	end 
end
