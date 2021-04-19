require 'test_helper'

class EndUsers::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get end_users_orders_new_url
    assert_response :success
  end

  test "should get confirm" do
    get end_users_orders_confirm_url
    assert_response :success
  end

  test "should get create" do
    get end_users_orders_create_url
    assert_response :success
  end

  test "should get thanx" do
    get end_users_orders_thanx_url
    assert_response :success
  end

  test "should get index" do
    get end_users_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get end_users_orders_show_url
    assert_response :success
  end

end
