require "test_helper"

class Users::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_portfolio" do
    get users_users_my_portfolio_url
    assert_response :success
  end
end
