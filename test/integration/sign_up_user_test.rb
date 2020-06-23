require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  
  test "sign up new user" do
    get "/signup"
    assert_response :success
    assert_difference "User.count",1 do
      post users_path, params: {user:{username: "anyuser" , email: "anyemail@example.com",
                                      password: "password", password_confirmation: "password"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Articles", response.body
    
  end

  test "login an existing user" do
    @user = User.create(username: "anyuser" , email: "anyemail@example.com", password: "password", password_confirmation: "password")
    get "/login"
    assert_response :success
    sign_in_as(@user)
    assert_equal(session[:user_id],@user.id)
    assert_response :redirect
        
    follow_redirect!
    assert_response :success
    assert_match @user.username, response.body
    
  end

end
