require 'test_helper'

module Helpdesk
  class StatusesControllerTest < ActionController::TestCase
    setup do
      @status = helpdesk_statuses(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:statuses)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create status" do
      assert_difference('Status.count') do
        post :create, status: { name: @status.name }
      end

      assert_redirected_to status_path(assigns(:status))
    end

    test "should show status" do
      get :show, id: @status
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @status
      assert_response :success
    end

    test "should update status" do
      patch :update, id: @status, status: { name: @status.name }
      assert_redirected_to status_path(assigns(:status))
    end

    test "should destroy status" do
      assert_difference('Status.count', -1) do
        delete :destroy, id: @status
      end

      assert_redirected_to statuses_path
    end
  end
end
