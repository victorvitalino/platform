require 'test_helper'

module Concourse
  class SubscribesControllerTest < ActionController::TestCase
    setup do
      @subscribe = concourse_subscribes(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:subscribes)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create subscribe" do
      assert_difference('Subscribe.count') do
        post :create, subscribe: { bank_slip_id: @subscribe.bank_slip_id, end: @subscribe.end, fee: @subscribe.fee, fee_value: @subscribe.fee_value, observation: @subscribe.observation, project_id: @subscribe.project_id, publish: @subscribe.publish, start: @subscribe.start, title: @subscribe.title }
      end

      assert_redirected_to subscribe_path(assigns(:subscribe))
    end

    test "should show subscribe" do
      get :show, id: @subscribe
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @subscribe
      assert_response :success
    end

    test "should update subscribe" do
      patch :update, id: @subscribe, subscribe: { bank_slip_id: @subscribe.bank_slip_id, end: @subscribe.end, fee: @subscribe.fee, fee_value: @subscribe.fee_value, observation: @subscribe.observation, project_id: @subscribe.project_id, publish: @subscribe.publish, start: @subscribe.start, title: @subscribe.title }
      assert_redirected_to subscribe_path(assigns(:subscribe))
    end

    test "should destroy subscribe" do
      assert_difference('Subscribe.count', -1) do
        delete :destroy, id: @subscribe
      end

      assert_redirected_to subscribes_path
    end
  end
end
