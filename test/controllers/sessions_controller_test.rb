require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login_user" do
    get sessions_login_user_url
    assert_response :success
  end

  test "should get login_manager" do
    get sessions_login_manager_url
    assert_response :success
  end

  test "should get persist_user" do
    get sessions_persist_user_url
    assert_response :success
  end

  test "should get persist_manager" do
    get sessions_persist_manager_url
    assert_response :success
  end

end
