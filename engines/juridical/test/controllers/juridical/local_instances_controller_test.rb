require 'test_helper'

module Juridical
  class LocalInstancesControllerTest < ActionController::TestCase
    setup do
      @local_instance = juridical_local_instances(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:local_instances)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create local_instance" do
      assert_difference('LocalInstance.count') do
        post :create, local_instance: { description: @local_instance.description, instance_id: @local_instance.instance_id, name: @local_instance.name }
      end

      assert_redirected_to local_instance_path(assigns(:local_instance))
    end

    test "should show local_instance" do
      get :show, id: @local_instance
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @local_instance
      assert_response :success
    end

    test "should update local_instance" do
      patch :update, id: @local_instance, local_instance: { description: @local_instance.description, instance_id: @local_instance.instance_id, name: @local_instance.name }
      assert_redirected_to local_instance_path(assigns(:local_instance))
    end

    test "should destroy local_instance" do
      assert_difference('LocalInstance.count', -1) do
        delete :destroy, id: @local_instance
      end

      assert_redirected_to local_instances_path
    end
  end
end
