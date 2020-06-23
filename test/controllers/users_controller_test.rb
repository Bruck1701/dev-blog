require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(username: "anyuser" , email: "anyemail@example.com", password: "password", password_confirmation: "password")
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: {username: "otheruser" , email: "otheruser@example.com", password: "password", password_confirmation: "password"  } }
    end
    assert_redirected_to articles_url
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    sign_in_as(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    sign_in_as(@user)
    patch user_url(@user), params: { user: {password: "password2", password_confirmation: "password2"  } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    sign_in_as(@user)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to articles_url
  end
end
