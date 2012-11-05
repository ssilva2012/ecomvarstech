require 'test_helper'

class PlumberListsControllerTest < ActionController::TestCase
  setup do
    @plumber_list = plumber_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plumber_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plumber_list" do
    assert_difference('PlumberList.count') do
      post :create, plumber_list: @plumber_list.attributes
    end

    assert_redirected_to plumber_list_path(assigns(:plumber_list))
  end

  test "should show plumber_list" do
    get :show, id: @plumber_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plumber_list
    assert_response :success
  end

  test "should update plumber_list" do
    put :update, id: @plumber_list, plumber_list: @plumber_list.attributes
    assert_redirected_to plumber_list_path(assigns(:plumber_list))
  end

  test "should destroy plumber_list" do
    assert_difference('PlumberList.count', -1) do
      delete :destroy, id: @plumber_list
    end

    assert_redirected_to plumber_lists_path
  end
end
