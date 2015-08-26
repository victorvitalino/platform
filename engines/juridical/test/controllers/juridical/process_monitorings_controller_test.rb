require 'test_helper'

module Juridical
  class ProcessMonitoringsControllerTest < ActionController::TestCase
    setup do
      @process_monitoring = juridical_process_monitorings(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:process_monitorings)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create process_monitoring" do
      assert_difference('ProcessMonitoring.count') do
        post :create, process_monitoring: { action_type_id: @process_monitoring.action_type_id, complemet: @process_monitoring.complemet, end_date: @process_monitoring.end_date, initial_date: @process_monitoring.initial_date, lawyer_responsible_id: @process_monitoring.lawyer_responsible_id, local_instance_id: @process_monitoring.local_instance_id, number_administrative_process: @process_monitoring.number_administrative_process, number_lawsuit: @process_monitoring.number_lawsuit, organ: @process_monitoring.organ, part: @process_monitoring.part, process_type: @process_monitoring.process_type, status: @process_monitoring.status, value_cause: @process_monitoring.value_cause }
      end

      assert_redirected_to process_monitoring_path(assigns(:process_monitoring))
    end

    test "should show process_monitoring" do
      get :show, id: @process_monitoring
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @process_monitoring
      assert_response :success
    end

    test "should update process_monitoring" do
      patch :update, id: @process_monitoring, process_monitoring: { action_type_id: @process_monitoring.action_type_id, complemet: @process_monitoring.complemet, end_date: @process_monitoring.end_date, initial_date: @process_monitoring.initial_date, lawyer_responsible_id: @process_monitoring.lawyer_responsible_id, local_instance_id: @process_monitoring.local_instance_id, number_administrative_process: @process_monitoring.number_administrative_process, number_lawsuit: @process_monitoring.number_lawsuit, organ: @process_monitoring.organ, part: @process_monitoring.part, process_type: @process_monitoring.process_type, status: @process_monitoring.status, value_cause: @process_monitoring.value_cause }
      assert_redirected_to process_monitoring_path(assigns(:process_monitoring))
    end

    test "should destroy process_monitoring" do
      assert_difference('ProcessMonitoring.count', -1) do
        delete :destroy, id: @process_monitoring
      end

      assert_redirected_to process_monitorings_path
    end
  end
end
