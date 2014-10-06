require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get redirectcode when get explore path" do
    get :explore
    assert_response :redirect
  end

  test "get redirect_to suggest" do
    get :explore
    assert_redirected_to suggest_path
  end
end
