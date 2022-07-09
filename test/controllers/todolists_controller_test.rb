require "test_helper"

class TodolistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @todolist = Todolist.create(work: "test", user: @user)
    sign_in_as(@user)
  end

  test "should get index" do
    get todolists_url
    assert_response :success
  end

  test "should get new" do
    get new_todolist_url
    assert_response :success
  end

  test "should create todolist" do
    assert_difference('Todolist.count',1 ) do
      post todolists_url, params: { todolist: { work: "testing", user: @user  } }
    end

    assert_redirected_to todolist_url(Todolist.last)
  end

  test "should show todolist" do
    get todolist_url(@todolist)
    assert_response :success
  end

  test "should get edit" do
    get edit_todolist_url(@todolist)
    assert_response :success
  end

  test "should update todolist" do
    patch todolist_url(@todolist), params: { todolist: {  work: "testing2", user: @user } }
    assert_redirected_to todolist_url(@todolist)
  end

  test "should destroy todolist" do
    assert_difference('Todolist.count', -1) do
      delete todolist_url(@todolist)
    end

    assert_redirected_to todolists_url
  end
end
