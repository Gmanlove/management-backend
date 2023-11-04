require "test_helper"

class Api::V1::PositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_positions_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_positions_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_positions_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_positions_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_positions_destroy_url
    assert_response :success
  end
end
