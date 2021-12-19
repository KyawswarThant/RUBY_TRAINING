require 'test_helper'

class AgeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get age_index_url
    assert_response :success
  end

end
