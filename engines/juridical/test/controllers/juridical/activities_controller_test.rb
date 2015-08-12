require 'test_helper'

module Juridical
  class ActivitiesControllerTest < ActionController::TestCase
    setup do
      @activity = juridical_activities(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:activities)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create activity" do
      assert_difference('Activity.count') do
        post :create, activity: { action_type_id: @activity.action_type_id, attachment: @activity.attachment, complemet: @activity.complemet, date_distribution: @activity.date_distribution, days: @activity.days, deadline: @activity.deadline, document_type_id: @activity.document_type_id, end_date: @activity.end_date, local_instance_id: @activity.local_instance_id, monitoring_type: @activity.monitoring_type, status: @activity.status, user_id: @activity.user_id }
      end

      assert_redirected_to activity_path(assigns(:activity))
    end

    test "should show activity" do
      get :show, id: @activity
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @activity
      assert_response :success
    end

    test "should update activity" do
      patch :update, id: @activity, activity: { action_type_id: @activity.action_type_id, attachment: @activity.attachment, complemet: @activity.complemet, date_distribution: @activity.date_distribution, days: @activity.days, deadline: @activity.deadline, document_type_id: @activity.document_type_id, end_date: @activity.end_date, local_instance_id: @activity.local_instance_id, monitoring_type: @activity.monitoring_type, status: @activity.status, user_id: @activity.user_id }
      assert_redirected_to activity_path(assigns(:activity))
    end

    test "should destroy activity" do
      assert_difference('Activity.count', -1) do
        delete :destroy, id: @activity
      end

      assert_redirected_to activities_path
    end
  end
end
