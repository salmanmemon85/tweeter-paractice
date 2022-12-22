require "test_helper"

class TweetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tweet_index_url
    assert_response :success
  end

  test "should get create" do
    get tweet_create_url
    assert_response :success
  end

  test "should get destroy" do
    get tweet_destroy_url
    assert_response :success
  end
end
