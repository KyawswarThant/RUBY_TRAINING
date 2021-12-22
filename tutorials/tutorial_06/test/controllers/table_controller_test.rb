require 'test_helper'

class TableControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get table_index_url
    assert_response :success
  end

end
