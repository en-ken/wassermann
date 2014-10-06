require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get redirectcode when get explore path" do
    get :explore
    assert_response :redirect
  end

  test "get redirect_to resulre" do
    get :explore
    assert_redirected_to result_path
  end
end
