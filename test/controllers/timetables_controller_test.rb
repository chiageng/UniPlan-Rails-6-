require "test_helper"

class TimetablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @timetable = Timetable.create(work: "test", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" )
    @timetable = Timetable.create(work: "test", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "todo" )
    sign_in_as(@user)
  end

  test "should get index" do
    get timetables_url
    assert_response :success
  end

  test "should get new" do
    get new_timetable_url
    assert_response :success
  end

  test "should create timetable" do
    assert_difference('Timetable.count', 1) do
      post timetables_url, params: { timetable: { work: "test2", day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work" } }
    end

    assert_redirected_to timetable_url(Timetable.last)
  end

  test "should create todo" do
    assert_difference('Todolist.count', 1) do
      post timetables_url, params: { timetable: { work: "test2", day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "To-do" } }
    end

    assert_redirected_to todolist_url(Todolist.last)
  end

  test "should show timetable" do
    get timetable_url(@timetable)
    assert_response :success
  end

  test "should get edit" do
    get edit_timetable_url(@timetable)
    assert_response :success
  end

  test "should update timetable" do
    patch timetable_url(@timetable), params: { timetable: {work: "test-edit", user: @user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "work"  } }
    assert_redirected_to timetable_url(@timetable)
  end

  test "should destroy timetable" do
    assert_difference('Timetable.count', -1) do
      delete timetable_url(@timetable)
    end

    assert_redirected_to timetables_url
  end
end
