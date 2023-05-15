require "test_helper"

class Public::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_users_show_url
    assert_response :success
  end

  test "should get index" do
    get public_users_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_users_edit_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get public_users_unsubscribe_url
    assert_response :success
  end

  test "should get favorite" do
    get public_users_favorite_url
    assert_response :success
  end

  test "should get follow" do
    get public_users_follow_url
    assert_response :success
  end

  test "should get search" do
    get public_users_search_url
    assert_response :success
  end
end
