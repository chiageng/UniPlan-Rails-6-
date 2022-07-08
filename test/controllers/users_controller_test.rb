require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "test", email: "test@example.com", password: "test")
  end

  test "should get index" do
    sign_in_as(@user)
    get users_url
    assert_response :success
  end

  test "should get sign up page" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count',1 ) do
      post users_url, params: { user: { username: "test1", email: "test1@example.com", password: "test1" } }
    end

    assert_redirected_to login_url
  end

  test "should show user" do
    sign_in_as(@user)
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    sign_in_as(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    sign_in_as(@user)
    patch user_url(@user), params: { user: { username: "test-edit", email: "test@example.com", password: "test" } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    sign_in_as(@user)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to root_url
  end
end
