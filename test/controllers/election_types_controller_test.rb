require 'test_helper'

class ElectionTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @election_type = election_types(:one)
  end

  test "should get index" do
    get election_types_url
    assert_response :success
  end

  test "should get new" do
    get new_election_type_url
    assert_response :success
  end

  test "should create election_type" do
    assert_difference('ElectionType.count') do
      post election_types_url, params: { election_type: { name: @election_type.name } }
    end

    assert_redirected_to election_type_url(ElectionType.last)
  end

  test "should show election_type" do
    get election_type_url(@election_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_election_type_url(@election_type)
    assert_response :success
  end

  test "should update election_type" do
    patch election_type_url(@election_type), params: { election_type: { name: @election_type.name } }
    assert_redirected_to election_type_url(@election_type)
  end

  test "should destroy election_type" do
    assert_difference('ElectionType.count', -1) do
      delete election_type_url(@election_type)
    end

    assert_redirected_to election_types_url
  end
end
