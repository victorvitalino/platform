require 'test_helper'

module Concourse
  class ParticipationsControllerTest < ActionController::TestCase
    setup do
      @participation = concourse_participations(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:participations)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create participation" do
      assert_difference('Participation.count') do
        post :create, participation: { end: @participation.end, observation: @participation.observation, project_id: @participation.project_id, publish: @participation.publish, start: @participation.start, subscribe_id: @participation.subscribe_id, title: @participation.title }
      end

      assert_redirected_to participation_path(assigns(:participation))
    end

    test "should show participation" do
      get :show, id: @participation
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @participation
      assert_response :success
    end

    test "should update participation" do
      patch :update, id: @participation, participation: { end: @participation.end, observation: @participation.observation, project_id: @participation.project_id, publish: @participation.publish, start: @participation.start, subscribe_id: @participation.subscribe_id, title: @participation.title }
      assert_redirected_to participation_path(assigns(:participation))
    end

    test "should destroy participation" do
      assert_difference('Participation.count', -1) do
        delete :destroy, id: @participation
      end

      assert_redirected_to participations_path
    end
  end
end
