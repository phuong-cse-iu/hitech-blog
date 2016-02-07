require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  #create a couple of categories for testing list page
  def setup
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end

  test "should show categories listing" do 
    # get to the category listing page
    get categories_path
    #ensure the template of index page
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category), text: @category.name
    assert_select "a[href=?]", category_path(@category2), text: @category2.name
  end
  
end