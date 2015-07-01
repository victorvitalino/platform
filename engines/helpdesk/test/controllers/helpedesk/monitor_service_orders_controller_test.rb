require 'test_helper'

module Helpedesk
  class MonitorServiceOrdersControllerTest < ActionController::TestCase
    setup do
      @monitor_service_order = monitor_service_orders(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:monitor_service_orders)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create monitor_service_order" do
      assert_difference('MonitorServiceOrder.count') do
        post :create, monitor_service_order: { appointment: @monitor_service_order.appointment, attachment: @monitor_service_order.attachment, name: @monitor_service_order.name, order_service_id: @monitor_service_order.order_service_id, status: @monitor_service_order.status }
      end

      assert_redirected_to monitor_service_order_path(assigns(:monitor_service_order))
    end

    test "should show monitor_service_order" do
      get :show, id: @monitor_service_order
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @monitor_service_order
      assert_response :success
    end

    test "should update monitor_service_order" do
      patch :update, id: @monitor_service_order, monitor_service_order: { appointment: @monitor_service_order.appointment, attachment: @monitor_service_order.attachment, name: @monitor_service_order.name, order_service_id: @monitor_service_order.order_service_id, status: @monitor_service_order.status }
      assert_redirected_to monitor_service_order_path(assigns(:monitor_service_order))
    end

    test "should destroy monitor_service_order" do
      assert_difference('MonitorServiceOrder.count', -1) do
        delete :destroy, id: @monitor_service_order
      end

      assert_redirected_to monitor_service_orders_path
    end
  end
end
