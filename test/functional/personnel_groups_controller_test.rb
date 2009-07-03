require 'test_helper'

class PersonnelGroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personnel_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personnel_group" do
    assert_difference('PersonnelGroup.count') do
      post :create, :personnel_group => { }
    end

    assert_redirected_to personnel_group_path(assigns(:personnel_group))
  end

  test "should show personnel_group" do
    get :show, :id => personnel_groups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => personnel_groups(:one).to_param
    assert_response :success
  end

  test "should update personnel_group" do
    put :update, :id => personnel_groups(:one).to_param, :personnel_group => { }
    assert_redirected_to personnel_group_path(assigns(:personnel_group))
  end

  test "should destroy personnel_group" do
    assert_difference('PersonnelGroup.count', -1) do
      delete :destroy, :id => personnel_groups(:one).to_param
    end

    assert_redirected_to personnel_groups_path
  end
end
