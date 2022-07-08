require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "category should be valid" do
    @category = Category.create(category: "Maths")
    assert @category.valid?
  end

  test "name should be present" do 
    @category = Category.create(category: " ")
    assert_not @category.valid?
  end 

  test "name should be unique" do 
    @category = Category.create(category: "Maths")
    @category.save
    @category2 = Category.create(category: "Maths")
    assert_not @category2.valid?
  end 
end
