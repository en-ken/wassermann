require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test 'should respond with success' do
    get :index
    assert_response :success
  end

  test 'should title aimai-lunch' do
    get :index
    assert_select 'title', 'aimai-lunch'
  end

  test 'should template index' do
    get :index
    assert_template 'index'
  end

  test 'should have /explore link' do
    get :index
    assert_select 'div a[href=/explore]'
  end
end
