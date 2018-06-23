require 'test_helper'

class AlliancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alliance = alliances(:one)
  end

  test "should get index" do
    get alliances_url
    assert_response :success
  end

  test "should get new" do
    get new_alliance_url
    assert_response :success
  end

  test "should create alliance" do
    assert_difference('Alliance.count') do
      post alliances_url, params: { alliance: { name: @alliance.name } }
    end

    assert_redirected_to alliance_url(Alliance.last)
  end

  test "should show alliance" do
    get alliance_url(@alliance)
    assert_response :success
  end

  test "should get edit" do
    get edit_alliance_url(@alliance)
    assert_response :success
  end

  test "should update alliance" do
    patch alliance_url(@alliance), params: { alliance: { name: @alliance.name } }
    assert_redirected_to alliance_url(@alliance)
  end

  test "should destroy alliance" do
    assert_difference('Alliance.count', -1) do
      delete alliance_url(@alliance)
    end

    assert_redirected_to alliances_url
  end
end
