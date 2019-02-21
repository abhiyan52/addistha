require 'test_helper'

class SlotItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slot_items_index_url
    assert_response :success
  end

  test "should get show" do
    get slot_items_show_url
    assert_response :success
  end

  test "should get list" do
    get slot_items_list_url
    assert_response :success
  end

end
