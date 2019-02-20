require 'test_helper'

class AdvertisementControllerTest < ActionDispatch::IntegrationTest
  test "should get create," do
    get advertisement_create,_url
    assert_response :success
  end

  test "should get new," do
    get advertisement_new,_url
    assert_response :success
  end

  test "should get index," do
    get advertisement_index,_url
    assert_response :success
  end

  test "should get show," do
    get advertisement_show,_url
    assert_response :success
  end

  test "should get edit," do
    get advertisement_edit,_url
    assert_response :success
  end

  test "should get delete," do
    get advertisement_delete,_url
    assert_response :success
  end

  test "should get destroy," do
    get advertisement_destroy,_url
    assert_response :success
  end

  test "should get update" do
    get advertisement_update_url
    assert_response :success
  end

end
