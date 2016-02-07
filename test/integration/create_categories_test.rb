require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do 
  	#display new form for creating category
    get new_category_path
    #ensure this path(form) happens
    assert_template 'categories/new'
    #able to create category
    assert_difference 'Category.count', 1 do 
      post_via_redirect categories_path, category: {name: "sport"}
    end
    #where we send user to somewhre after category created
    assert_template 'categories/index'
    #ensure that category name should be display on index page
    assert_match "sport", response.body
  end

  test "invalid category submission results in failure" do 
  	#display new form for creating category
    get new_category_path
    #ensure this path happens
    assert_template 'categories/new'
    #actually able to create category. This test should return false, then it is passed
    assert_no_difference 'Category.count' do 
      post categories_path, category: {name: " "}
    end
    #because fail in create category
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end