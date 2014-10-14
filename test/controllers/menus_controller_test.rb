require 'test_helper'

Class MenusControllerTest < ActionController::TestCase
  #Page Validation
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'index title should be aimai-lunch' do
    get :index
    assert_select 'title', 'aimai-lunch'
  end

  test 'index should render correct template and layout' do
    get :index
    assert_template :index
    assert_template layout: "layouts/applicaiton"
  end

  #Redirect Validation
  test 'explore should redirect to index if there is no args' do
    get :explore
    assert_redirected_to index_path
  end

  test 'explore should redirect to suggest if there are args' do
    get :explore, :judge 'yes'
    assert_redirected_to suggest_path
  end
end
