require 'test_helper'

class BannersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
