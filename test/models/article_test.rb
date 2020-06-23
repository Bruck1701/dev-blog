require 'test_helper'


class ArticleTest < ActiveSupport::TestCase

def setup
  @user=User.new(username: "anyuser" , email: "anyemail@example.com", password: "anything", password_confirmation: "anything")
  @article= Article.new(title:"Some Title",content: "this is the content", user:@user)
end

test "article should be valid" do
  assert @article.valid?
end

test "title should be present" do
  @article.title=""
  assert_not @article.valid?
end


test "title should not be to short" do
  @article.title="abcde"
  assert_not @article.valid?
end

test "title should not be to long" do
  @article.title = "a"*101
  assert_not @article.valid?
end


test "content should be present" do
  @article.content = ""
  assert_not @article.valid?
end

test "content should not be too short" do
  @article.content = "123456789"
  assert_not @article.valid?
end

test "content should not be too long" do
  @article.content = "a"*10001
  assert_not @article.valid?
end





end