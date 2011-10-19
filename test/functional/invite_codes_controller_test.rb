require 'test_helper'

class InviteCodesControllerTest < ActionController::TestCase
  setup do
    @invite_code = invite_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invite_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invite_code" do
    assert_difference('InviteCode.count') do
      post :create, :invite_code => @invite_code.attributes
    end

    assert_redirected_to invite_code_path(assigns(:invite_code))
  end

  test "should show invite_code" do
    get :show, :id => @invite_code.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @invite_code.to_param
    assert_response :success
  end

  test "should update invite_code" do
    put :update, :id => @invite_code.to_param, :invite_code => @invite_code.attributes
    assert_redirected_to invite_code_path(assigns(:invite_code))
  end

  test "should destroy invite_code" do
    assert_difference('InviteCode.count', -1) do
      delete :destroy, :id => @invite_code.to_param
    end

    assert_redirected_to invite_codes_path
  end
end
