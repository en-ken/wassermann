require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  #Redirect Validation
  test 'explore should redirect to index if there is no args' do
    get :explore, :feel => nil
    assert_redirected_to index_path
  end

  test 'explore should redirect to suggest if there are args' do
    get :suggest, :feel => 'light'
    assert_redirected_to suggest_path
  end
end
