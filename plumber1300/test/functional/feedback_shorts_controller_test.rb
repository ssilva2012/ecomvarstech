require 'test_helper'

class FeedbackShortsControllerTest < ActionController::TestCase
  setup do
    @feedback_short = feedback_shorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedback_shorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback_short" do
    assert_difference('FeedbackShort.count') do
      post :create, feedback_short: @feedback_short.attributes
    end

    assert_redirected_to feedback_short_path(assigns(:feedback_short))
  end

  test "should show feedback_short" do
    get :show, id: @feedback_short
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback_short
    assert_response :success
  end

  test "should update feedback_short" do
    put :update, id: @feedback_short, feedback_short: @feedback_short.attributes
    assert_redirected_to feedback_short_path(assigns(:feedback_short))
  end

  test "should destroy feedback_short" do
    assert_difference('FeedbackShort.count', -1) do
      delete :destroy, id: @feedback_short
    end

    assert_redirected_to feedback_shorts_path
  end
end
