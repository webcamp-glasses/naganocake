require 'test_helper'

class EndUsers::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get end_users_end_users_show_url
    assert_response :success
  end

  test "should get hide" do
    get end_users_end_users_hide_url
    assert_response :success
  end

  test "should get out" do
    get end_users_end_users_out_url
    assert_response :success
  end

  test "should get edit" do
    get end_users_end_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get end_users_end_users_update_url
    assert_response :success
  end

end
