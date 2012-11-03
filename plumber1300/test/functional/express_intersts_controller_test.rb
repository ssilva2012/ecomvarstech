require 'test_helper'

class ExpressInterstsControllerTest < ActionController::TestCase
  setup do
    @express_interst = express_intersts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:express_intersts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create express_interst" do
    assert_difference('ExpressInterst.count') do
      post :create, express_interst: @express_interst.attributes
    end

    assert_redirected_to express_interst_path(assigns(:express_interst))
  end

  test "should show express_interst" do
    get :show, id: @express_interst
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @express_interst
    assert_response :success
  end

  test "should update express_interst" do
    put :update, id: @express_interst, express_interst: @express_interst.attributes
    assert_redirected_to express_interst_path(assigns(:express_interst))
  end

  test "should destroy express_interst" do
    assert_difference('ExpressInterst.count', -1) do
      delete :destroy, id: @express_interst
    end

    assert_redirected_to express_intersts_path
  end
end
