require "application_system_test_case"

class ForumsTest < ApplicationSystemTestCase
  setup do
    @admin_user = User.create(username: "123", email: "123@example.com", password: "123", admin: true)
    @forum = Forum.create(topic: "test", description: "test", user: @admin_user)
    login(@admin_user)
  end

  test "visiting the index" do
    visit forums_url
    assert_selector "a", text: "Create New Forum"
  end

  test "creating a Forum" do
    visit forums_url
    click_on "Create New Forum"

    fill_in "Forum Topic", with: "Testing"
    fill_in "Forum Description", with: "Testing"

    click_on "Create Forum"

    assert_text "A new forum is created successfully"
    assert_selector "h5", text: "Testing"
  end

  test "updating a Forum" do
    visit forums_url
    click_on "Edit", match: :first

    fill_in "Forum Topic", with: "Testing-edited"
    fill_in "Forum Description", with: "Testing-edited"

    click_on "Create Forum"

    assert_text "Your forum has been updated successfully"
    assert_selector "h5", text: "Testing-edited"
  end

  test "destroying a Forum" do
    visit forums_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Your forum has been deleted successfully"
  end
end
