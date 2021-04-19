require 'test_helper'

class EndUsers::AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_address_index_url
    assert_response :success
  end

  test "should get create" do
    get end_users_address_create_url
    assert_response :success
  end

  test "should get destroy" do
    get end_users_address_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get end_users_address_edit_url
    assert_response :success
  end

  test "should get update" do
    get end_users_address_update_url
    assert_response :success
  end

end
