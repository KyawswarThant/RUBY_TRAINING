require 'test_helper'

class UploadFileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upload_file_index_url
    assert_response :success
  end

end
