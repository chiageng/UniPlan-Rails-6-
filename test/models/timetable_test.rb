require "test_helper"

class TimetableTest < ActiveSupport::TestCase
  def setup 
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @user.save 
    @timetable = Timetable.create(work: "test", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" )
  end

  test "create new timetable work" do
    assert @timetable.valid? 
  end 

  test "work name should be present" do 
    @timetable.work = " "
    assert_not @timetable.valid? 
  end 

  test "day have to be present" do 
    @timetable2 = Timetable.create(work: "test", user: @user, starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" )
    assert_not @timetable2.valid? 
  end 

  test "starttime have to be present" do 
    @timetable2 = Timetable.create(work: "test", user: @user, day: "Mon", endtime: Time.utc(2000,1,1,8,0,0), category: "work" )
    assert_not @timetable2.valid? 
  end 

  test "endtime have to be present" do 
    @timetable2 = Timetable.create(work: "test", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), category: "work" )
    assert_not @timetable2.valid? 
  end 

  test "category have to be present" do 
    @timetable2 = Timetable.create(work: "test", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0))
    assert_not @timetable2.valid? 
  end 

  test "timetable have to belongs to a user" do 
    @timetable2 = Timetable.create(work: "test", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" )
    assert_not @timetable2.valid? 
  end 
end
