require 'test_helper'

module Juridical
  class InstancesControllerTest < ActionController::TestCase
    setup do
      @instance = juridical_instances(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:instances)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create instance" do
      assert_difference('Instance.count') do
        post :create, instance: { description: @instance.description, name: @instance.name }
      end

      assert_redirected_to instance_path(assigns(:instance))
    end

    test "should show instance" do
      get :show, id: @instance
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @instance
      assert_response :success
    end

    test "should update instance" do
      patch :update, id: @instance, instance: { description: @instance.description, name: @instance.name }
      assert_redirected_to instance_path(assigns(:instance))
    end

    test "should destroy instance" do
      assert_difference('Instance.count', -1) do
        delete :destroy, id: @instance
      end

      assert_redirected_to instances_path
    end
  end
end
