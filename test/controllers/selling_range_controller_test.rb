require 'test_helper'

class SellingRangeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get selling_range_new_url
    assert_response :success
  end

  test "should get create" do
    get selling_range_create_url
    assert_response :success
  end

  test "should get destroy" do
    get selling_range_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get selling_range_edit_url
    assert_response :success
  end

  test "should get update" do
    get selling_range_update_url
    assert_response :success
  end

  test "should get index" do
    get selling_range_index_url
    assert_response :success
  end

end
