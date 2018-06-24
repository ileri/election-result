require 'test_helper'

class Admin::CandidatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_candidates_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_candidates_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_candidates_edit_url
    assert_response :success
  end

end
