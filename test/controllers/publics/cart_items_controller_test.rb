require "test_helper"

class Publics::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_cart_items_index_url
    assert_response :success
  end
end
