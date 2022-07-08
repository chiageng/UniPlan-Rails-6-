require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @user = User.create(username: "test", email: "test@example.com", password: "test")
    @admin_user = User.create(username: "admin", email: "admin@example.com", password: "admin", admin: true)
    sign_in_as(@admin_user)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count',1 ) do
      post categories_url, params: { category: {category: "test"  } }
    end
  
    assert_redirected_to categories_url
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: {category: "edit-test" } }
    assert_redirected_to categories_url
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end

    assert_redirected_to categories_url
  end
end
