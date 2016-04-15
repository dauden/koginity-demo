require 'test_helper'

class Admin::ProductControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get add" do
    get :add
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
