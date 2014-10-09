require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  #

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get explore" do
    get :explore
    assert_response :success
  end

#  test "get redirect_to suggest" do
#    get :explore
#    assert_redirected_to suggest_path
#  end
end
