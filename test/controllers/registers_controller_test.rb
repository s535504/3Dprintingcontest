require 'test_helper'

class RegistersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get confirm" do
    get :confirm
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
