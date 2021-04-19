require 'test_helper'

class EndUsers::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_cart_items_index_url
    assert_response :success
  end

  test "should get create" do
    get end_users_cart_items_create_url
    assert_response :success
  end

  test "should get destroy" do
    get end_users_cart_items_destroy_url
    assert_response :success
  end

  test "should get update" do
    get end_users_cart_items_update_url
    assert_response :success
  end

  test "should get all_destroy" do
    get end_users_cart_items_all_destroy_url
    assert_response :success
  end

end
