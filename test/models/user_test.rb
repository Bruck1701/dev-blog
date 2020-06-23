require 'test_helper'


class UserTest < ActiveSupport::TestCase


  def setup
    @user=User.new(username: "anyuser" , 
                    email: "anyemail@example.com", password: "anything", password_confirmation: "anything")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "username should be unique" do
    @user.save
    @user2 = User.new(username: "anyuser" , 
      email: "otheremail@example.com", password: "anything1", password_confirmation: "anything1")
    
      assert_not @user2.valid?

  end

  test "usernamer should not be too short" do
    @user.username="ab"
    assert_not @user.valid?
  end

  test "username should not be too long" do 
    @user.username = "a"*26
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"+"@"+"a"*100+".com"
    assert_not @user.valid?
  end


  test "email should be unique" do
    @user.save
    @user2 = User.new(username: "otherperson" , 
      email: "anyemail@example.com", password: "anything1", password_confirmation: "anything1")
    
      assert_not @user2.valid?
  end

  test "email should be valid" do
    @user.email = "loremIpsum.com"

    assert_not @user.valid?
  end

  test "password should have confirmation" do 
    @user.password_confirmation = "other_thing"
    assert_not @user.valid?
  end







end
