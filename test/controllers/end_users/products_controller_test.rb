require 'test_helper'

class EndUsers::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_products_index_url
    assert_response :success
  end

  test "should get show" do
    get end_users_products_show_url
    assert_response :success
  end

end
