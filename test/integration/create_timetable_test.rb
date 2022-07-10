require "test_helper"

class CreateTimetableTest < ActionDispatch::IntegrationTest
  setup do 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    @timetable = Timetable.create(work: "test", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" )
  end 

  test "get new timetable form and create timetable" do
    sign_in_as(@user)
	  get "/timetables/new"
	  assert_response :success
	  assert_difference 'Timetable.count', 1 do 
	    post timetables_path, params: { timetable: { work: "test", day: "test", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" } }
	    assert_response :redirect
	  end
	  follow_redirect!
	  assert_response :success
	  assert_match "test", response.body
	end 

  test "get new timetable form and reject invalid submission" do
    sign_in_as(@user)
	  get "/timetables/new"
	  assert_response :success
	  assert_no_difference 'Timetable.count' do 
	    post timetables_path, params: { timetable: { work: "", day: "", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" } }
	  end
	  assert_match "errors", response.body
	end 

  test "get new timetable form without login send back invalid submission" do
	  get "/timetables/new"
	  assert_response :redirect
	  follow_redirect!
	  assert_response :success
	  assert_match "login", response.body
	end 
end
