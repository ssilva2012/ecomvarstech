require 'test_helper'

class PostcodeSuburbsControllerTest < ActionController::TestCase
  setup do
    @postcode_suburb = postcode_suburbs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postcode_suburbs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postcode_suburb" do
    assert_difference('PostcodeSuburb.count') do
      post :create, postcode_suburb: @postcode_suburb.attributes
    end

    assert_redirected_to postcode_suburb_path(assigns(:postcode_suburb))
  end

  test "should show postcode_suburb" do
    get :show, id: @postcode_suburb
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postcode_suburb
    assert_response :success
  end

  test "should update postcode_suburb" do
    put :update, id: @postcode_suburb, postcode_suburb: @postcode_suburb.attributes
    assert_redirected_to postcode_suburb_path(assigns(:postcode_suburb))
  end

  test "should destroy postcode_suburb" do
    assert_difference('PostcodeSuburb.count', -1) do
      delete :destroy, id: @postcode_suburb
    end

    assert_redirected_to postcode_suburbs_path
  end
end
