require 'test_helper'

class CustomerOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_orders_index_url
    assert_response :success
  end

end
