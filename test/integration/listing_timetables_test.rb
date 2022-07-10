require "test_helper"

class ListingTimetablesTest < ActionDispatch::IntegrationTest
  def setup 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    sign_in_as(@user)
    @timetable = Timetable.create(work: "test", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" )
    @timetable2 = Timetable.create(work: "test2", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" )
	end 
	
	test "should show timetables listing" do 
	  get '/timetables'
	  assert_select "a[href=?]", timetable_path(@timetable), text: @timetable.work.capitalize
	  assert_select "a[href=?]", timetable_path(@timetable2), text: @timetable2.work.capitalize
	end 
end
