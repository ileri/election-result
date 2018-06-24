require 'test_helper'

class Admin::AlliancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_alliances_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_alliances_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_alliances_edit_url
    assert_response :success
  end

end
