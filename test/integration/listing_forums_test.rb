require "test_helper"

class ListingForumsTest < ActionDispatch::IntegrationTest
  def setup 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    sign_in_as(@user)
      @forum = Forum.create(topic: "test", description: "test", user: @user)
      @forum2 = Forum.create(topic: "test2", description: "test2", user: @user)
	end 
	
	test "should show categories listing" do 
	  get '/forums'
	  assert_select "a[href=?]", forum_path(@forum), text: "Show"
	  assert_select "a[href=?]", forum_path(@forum2), text: "Show"
	end 
end
