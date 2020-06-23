require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  
  setup do
    @category = Category.create(name: "Ruby")  
    @user = User.create(username: "user",
                        email: "user@example.com", 
                        password: "password", 
                        password_confirmation:"password",
                        admin: true )

    sign_in_as(@user)
  end



  test "get new article form and create article" do
    get "/articles/new"
    assert_response :success

    assert_difference "Article.count", 1 do
      post articles_path, params: {article: {category_ids:["","1"], title:"Some diff title",content: "this is the content"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Some diff title" , response.body

  end


  test "new article form and reject invalid article submission" do

    get "/articles/new"
    assert_response :success

    assert_no_difference "Article.count" do
      post articles_path, params: {article: {category_ids:["","1"], title:"",content: "this is the content"}}
      
    end
    assert_match "errors", response.body  
    assert_select "div.alert"
    assert_select "h4.alert-heading"  
  end




end
