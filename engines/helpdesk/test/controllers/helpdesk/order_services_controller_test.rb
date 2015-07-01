require 'test_helper'

module Helpdesk
  class OrderServicesControllerTest < ActionController::TestCase
    setup do
      @order_service = helpdesk_order_services(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:order_services)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create order_service" do
      assert_difference('OrderService.count') do
        post :create, order_service: { branch_line_id: @order_service.branch_line_id, good_id: @order_service.good_id, number: @order_service.number, opened_by: @order_service.opened_by, prefix: @order_service.prefix, required_by: @order_service.required_by, sector_id: @order_service.sector_id, status_id: @order_service.status_id, user_id: @order_service.user_id }
      end

      assert_redirected_to order_service_path(assigns(:order_service))
    end

    test "should show order_service" do
      get :show, id: @order_service
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @order_service
      assert_response :success
    end

    test "should update order_service" do
      patch :update, id: @order_service, order_service: { branch_line_id: @order_service.branch_line_id, good_id: @order_service.good_id, number: @order_service.number, opened_by: @order_service.opened_by, prefix: @order_service.prefix, required_by: @order_service.required_by, sector_id: @order_service.sector_id, status_id: @order_service.status_id, user_id: @order_service.user_id }
      assert_redirected_to order_service_path(assigns(:order_service))
    end

    test "should destroy order_service" do
      assert_difference('OrderService.count', -1) do
        delete :destroy, id: @order_service
      end

      assert_redirected_to order_services_path
    end
  end
end
