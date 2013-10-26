require 'test_helper'

class ImporterControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get run" do
    get :run
    assert_response :success
  end

end
