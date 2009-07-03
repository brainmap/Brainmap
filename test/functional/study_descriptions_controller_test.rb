require 'test_helper'

class StudyDescriptionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:study_descriptions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_description" do
    assert_difference('StudyDescription.count') do
      post :create, :study_description => { }
    end

    assert_redirected_to study_description_path(assigns(:study_description))
  end

  test "should show study_description" do
    get :show, :id => study_descriptions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => study_descriptions(:one).to_param
    assert_response :success
  end

  test "should update study_description" do
    put :update, :id => study_descriptions(:one).to_param, :study_description => { }
    assert_redirected_to study_description_path(assigns(:study_description))
  end

  test "should destroy study_description" do
    assert_difference('StudyDescription.count', -1) do
      delete :destroy, :id => study_descriptions(:one).to_param
    end

    assert_redirected_to study_descriptions_path
  end
end
