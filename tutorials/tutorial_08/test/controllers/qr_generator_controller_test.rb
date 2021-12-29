require 'test_helper'

class QrGeneratorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get qr_generator_index_url
    assert_response :success
  end

end
