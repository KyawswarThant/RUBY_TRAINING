require 'test_helper'

class UploadImageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upload_image_index_url
    assert_response :success
  end

end
