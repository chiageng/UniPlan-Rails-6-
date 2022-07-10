require "application_system_test_case"

class CategoriesTest < ApplicationSystemTestCase
  setup do
    @category = categories(:one)
    @admin_user = User.create(username: "123", email: "123@example.com", password: "123", admin: true)
    login(@admin_user)
  end

  test "visiting the index" do
    visit categories_url
    assert_selector "h4", text: "Categories"
  end

  test "creating a Category" do
    visit categories_url
    click_on "Create New Category"

    fill_in "Category", with: "testing"

    click_on "Create Category"

    assert_text "The category has been created successfully"
    assert_selector "h4", text: "Categories"
  end

  test "updating a Category" do
    visit categories_url
    click_on "Edit", match: :first

    fill_in "Category", with: "edited now"

    click_on "Create Category"

    assert_text "The category has been updated successfully"
    assert_selector "h4", text: "Categories"
  end

  test "destroying a Category" do
    visit categories_url
    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "The category has been deleted successfully"
  end
end
