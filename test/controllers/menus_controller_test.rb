require 'test_helper'

class MenusControllerTest < ActionController::TestCase
  test 'should respond with success' do
    get :explore
    assert_response :success
  end

  test 'should title aimai-lunch' do
    get :explore
    assert_select 'title', 'aimai-lunch'
  end

  test 'should template index' do
    get :explore
    assert_template 'suggest'
  end

  test 'should have /explore link' do
    get :explore
    assert_select 'div a[href=/explore]'
  end
end
