require "test_helper"

class Api::V1::SchoolClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_school_classes_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_school_classes_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_school_classes_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_school_classes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_school_classes_destroy_url
    assert_response :success
  end
end
