require "application_system_test_case"

class ChatroomsTest < ApplicationSystemTestCase
  setup do
    @chatroom = chatrooms(:one)
    @admin_user = User.create(username: "123", email: "123@example.com", password: "123", admin: true)
    login(@admin_user)
  end

  test "visiting the index" do
    visit chatrooms_url
    assert_selector "a", text: "Create Chatroom"
  end

  test "creating a Chatroom" do
    visit chatrooms_url
    click_on "Create Chatroom"

    fill_in "Chatroom", with: "Test chatroom"

    click_on "Create Chatroom"

    assert_text "A new chatroom is created successfully"
    assert_selector "div", text: "Test chatroom"
  end

  # test "updating a Chatroom" do
  #   visit chatrooms_url
  #   click_on "Edit", match: :first

  #   click_on "Update Chatroom"

  #   assert_text "Chatroom was successfully updated"
  #   click_on "Back"
  # end

  # test "destroying a Chatroom" do
  #   visit chatrooms_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

  #   assert_text "Chatroom was successfully destroyed"
  # end
end
