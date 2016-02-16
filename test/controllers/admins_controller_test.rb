require 'test_helper'

class AdminsControllerTest < ActionController::TestCase
  test "should get registermanagement" do
    get :registermanagement
    assert_response :success
  end

end
