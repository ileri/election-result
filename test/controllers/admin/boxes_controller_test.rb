require 'test_helper'

class Admin::BoxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_boxes_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_boxes_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_boxes_edit_url
    assert_response :success
  end

end
