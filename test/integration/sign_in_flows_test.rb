require 'test_helper'

class SignInFlowsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "it goes to sign in page" do
    get new_user_session_path
    assert_response :success
    assert_select 'h2', "ログイン"
  end

  test "sign in as admin user" do
    sign_in users(:admin_user)
  end

  test "it needs to set profle to post stories" do
    sign_in users(:admin_user)

    get new_story_path
    assert_redirected_to profile_path
  end
end
