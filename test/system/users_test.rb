require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @admin_user = User.create(username: "123", email: "123@example.com", password: "123", admin: true)
    @user = User.create(username: "1234", email: "1234@example.com", password: "1234")
  end

  test "visiting the index" do
    login(@admin_user)
    visit users_url
    assert_selector "h4", text: "Users"
  end

  test "creating a User & login" do
    visit root_url
    click_on "Sign Up", match: :first

    fill_in "username", with: "newuser"
    fill_in "email@example.com", with: "newuser@example.com"
    fill_in "password", with: "newuser"

    find("input.btn.float-right.login_btn").click

    assert_text "Registration successful. Login to your account now!"

    visit login_url
    fill_in "email@example.com", with: "newuser@example.com"
    fill_in "password", with: "newuser"
    find("input.btn.float-right.login_btn").click
    assert_text "Newuser"

  end

  test "updating a User" do
    login(@admin_user)
    visit users_url
    click_on "Edit", match: :first

    click_on "Save Changes"

    assert_text "Your account has been updated successfully"
  end

  test "destroying a User" do
    login(@admin_user)
    visit users_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Your account has been deleted successfully"
  end
end
