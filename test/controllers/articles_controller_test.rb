require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user=User.create(username: "anyuser" , email: "anyemail@example.com", password: "password", password_confirmation: "password")
    @article= Article.create(title:"Some Title",content: "this is the content", user:@user)

  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user)
    get new_article_url
    assert_response :success
  end

  test "should not get the new article form" do
    get new_article_url
    assert_redirected_to login_url
  end


  test "should create article" do
    sign_in_as(@user)
    assert_difference('Article.count',1) do
      post articles_url, params: { article: {title:"Some other Title",content: "this is the new content", user:@user   } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end


  test "should get edit" do
    sign_in_as(@user)
    get edit_article_url(@article)
    assert_response :success
  end

  test "should not allow other user to edit" do
    @user2 = User.create(username: "otheruser" , email: "other@example.com", password: "password", password_confirmation: "password")
    sign_in_as(@user2)
    get edit_article_url(@article)
    assert_redirected_to @article
  end



  test "should update article" do
    sign_in_as(@user)
    patch article_url(@article), params: { article: {title:"Some other Title",content: "this is the new content", user:@user  } }
    assert_redirected_to article_url(@article)
  end

  test "should destroy article" do
    sign_in_as(@user)
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_redirected_to articles_url
  end
end
