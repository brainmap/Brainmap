require 'test_helper'

class BlurbsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blurbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blurb" do
    assert_difference('Blurb.count') do
      post :create, :blurb => { }
    end

    assert_redirected_to blurb_path(assigns(:blurb))
  end

  test "should show blurb" do
    get :show, :id => blurbs(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => blurbs(:one).to_param
    assert_response :success
  end

  test "should update blurb" do
    put :update, :id => blurbs(:one).to_param, :blurb => { }
    assert_redirected_to blurb_path(assigns(:blurb))
  end

  test "should destroy blurb" do
    assert_difference('Blurb.count', -1) do
      delete :destroy, :id => blurbs(:one).to_param
    end

    assert_redirected_to blurbs_path
  end
end
