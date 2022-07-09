require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @admin_user = User.create(username: "admin", email: "admin@example.com", password: "admin", admin: true)
    sign_in_as(@admin_user)
  end

  test "get new category form and create category" do
	  get "/categories/new"
	  assert_response :success
	  assert_difference 'Category.count', 1 do 
	    post categories_path, params: { category: { category: "Maths" } }
	    assert_response :redirect
	  end
	  follow_redirect!
	  assert_response :success
	  assert_match "Maths", response.body
	end 

  test "get new category form and reject invalid submission" do
	  get "/categories/new"
	  assert_response :success
	  assert_no_difference 'Category.count' do 
	    post categories_path, params: { category: { category: " " } }
	  end
	  assert_match "errors", response.body
	end 
end
