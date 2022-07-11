require "application_system_test_case"

class TimetablesTest < ApplicationSystemTestCase
  setup do
    @admin_user = User.create(username: "123", email: "123@example.com", password: "123", admin: true)
    @timetable = Timetable.create(work: "Test", user: @admin_user, day: "Mon", starttime:Time.utc(2000,1,1,8,0,0), endtime: Time.utc(2000,1,1,8,0,0), category: "Work" )
    login(@admin_user)
  end

  test "visiting the index" do
    visit timetables_url
    assert_selector "a", text: "All"
    assert_selector "a", text: "Study"
    assert_selector "a", text: "Work"
    assert_selector "a", text: "Social"
    assert_selector "a", text: "To-do"
    assert_selector "a", text: "Other"
  end

  test "creating a Timetable" do
    visit timetables_url
    click_on "Create New Work"

    fill_in "Work", with: "New work"

    click_on "Create Timetable"

    assert_text "Work was created successfully"
    click_on "Home"

    assert_selector "a", "New work"
  end

  test "updating a Timetable" do
    visit timetables_url
    click_on "Test", match: :first
    click_on "Edit"

    fill_in "Work", with: "New work"

    click_on "Create Timetable"

    assert_text "Your work is updated successfully"
    click_on "Home"

    assert_selector "a", "New work"
  end

  test "destroying a Timetable" do
    visit timetables_url
    click_on "Test", match: :first
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Your work has been deleted successfully"
  end


end
