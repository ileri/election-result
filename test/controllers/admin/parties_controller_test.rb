require 'test_helper'

class Admin::PartiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_parties_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_parties_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_parties_edit_url
    assert_response :success
  end

end
