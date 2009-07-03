require 'test_helper'

class JobAdvertisementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_advertisements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_advertisement" do
    assert_difference('JobAdvertisement.count') do
      post :create, :job_advertisement => { }
    end

    assert_redirected_to job_advertisement_path(assigns(:job_advertisement))
  end

  test "should show job_advertisement" do
    get :show, :id => job_advertisements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => job_advertisements(:one).to_param
    assert_response :success
  end

  test "should update job_advertisement" do
    put :update, :id => job_advertisements(:one).to_param, :job_advertisement => { }
    assert_redirected_to job_advertisement_path(assigns(:job_advertisement))
  end

  test "should destroy job_advertisement" do
    assert_difference('JobAdvertisement.count', -1) do
      delete :destroy, :id => job_advertisements(:one).to_param
    end

    assert_redirected_to job_advertisements_path
  end
end
