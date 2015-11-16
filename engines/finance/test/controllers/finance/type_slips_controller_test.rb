require 'test_helper'

module Finance
  class TypeSlipsControllerTest < ActionController::TestCase
    setup do
      @type_slip = finance_type_slips(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:type_slips)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create type_slip" do
      assert_difference('TypeSlip.count') do
        post :create, type_slip: { code: @type_slip.code, publish: @type_slip.publish, title: @type_slip.title, value: @type_slip.value }
      end

      assert_redirected_to type_slip_path(assigns(:type_slip))
    end

    test "should show type_slip" do
      get :show, id: @type_slip
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @type_slip
      assert_response :success
    end

    test "should update type_slip" do
      patch :update, id: @type_slip, type_slip: { code: @type_slip.code, publish: @type_slip.publish, title: @type_slip.title, value: @type_slip.value }
      assert_redirected_to type_slip_path(assigns(:type_slip))
    end

    test "should destroy type_slip" do
      assert_difference('TypeSlip.count', -1) do
        delete :destroy, id: @type_slip
      end

      assert_redirected_to type_slips_path
    end
  end
end
