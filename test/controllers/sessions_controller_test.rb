# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get new' do
    get login_path
    assert_response :success
  end

  test 'should login' do
    post login_path, params: { user: { username: @user.username, password: 'MyString#123' } }
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'should logout' do
    delete logout_path
    assert_response :redirect
    assert_redirected_to root_path
  end
end
