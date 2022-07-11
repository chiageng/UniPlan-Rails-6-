require "application_system_test_case"

class TodolistsTest < ApplicationSystemTestCase
  setup do
    @admin_user = User.create(username: "123", email: "123@example.com", password: "123", admin: true)
    @todolist = Todolist.create(work: "test", user: @admin_user)
    login(@admin_user)
  end

  test "visiting the index" do
    visit todolists_url
    assert_selector "a", text: "Create New Task"
  end

  test "creating a Todolist" do
    visit todolists_url
    click_on "Create New Task"

    fill_in "Work", with: "New task"

    click_on "Create Task"

    assert_text "Work was created successfully"
    click_on "Home"
  end

  test "updating a Todolist" do
    visit todolists_url
    click_on "Edit", match: :first

    fill_in "Work", with: "Edited"

    click_on "Create Task"

    assert_text "Your work is updated successfully"
    click_on "Home"

  end

  test "destroying a Todolist" do
    visit todolists_url
    click_on "Show", match: :first
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Your work has been deleted successfully"
  end
end
