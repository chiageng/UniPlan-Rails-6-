require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup 
    @admin_user = User.create(username: "admin", email: "admin@example.com", password: "admin", admin: true)
    sign_in_as(@admin_user)
	  @category = Category.create(category: "Maths")
	  @category2 = Category.create(category: "Science")
	end 
	
	test "should show categories listing" do 
	  get '/categories'
	  assert_select "a[href=?]", category_path(@category), text: "Show"
	  assert_select "a[href=?]", category_path(@category2), text: "Show"
	end 
end
