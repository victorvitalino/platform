require 'test_helper'

module RegularizationSchedule
  class SchedulesControllerTest < ActionController::TestCase
    setup do
      @schedule = regularization_schedule_schedules(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:schedules)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create schedule" do
      assert_difference('Schedule.count') do
        post :create, schedule: { agenda_id: @schedule.agenda_id, cpf: @schedule.cpf, date_schedule: @schedule.date_schedule, hour_schedule: @schedule.hour_schedule, observation: @schedule.observation, requeriment_id: @schedule.requeriment_id, status: @schedule.status }
      end

      assert_redirected_to schedule_path(assigns(:schedule))
    end

    test "should show schedule" do
      get :show, id: @schedule
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @schedule
      assert_response :success
    end

    test "should update schedule" do
      patch :update, id: @schedule, schedule: { agenda_id: @schedule.agenda_id, cpf: @schedule.cpf, date_schedule: @schedule.date_schedule, hour_schedule: @schedule.hour_schedule, observation: @schedule.observation, requeriment_id: @schedule.requeriment_id, status: @schedule.status }
      assert_redirected_to schedule_path(assigns(:schedule))
    end

    test "should destroy schedule" do
      assert_difference('Schedule.count', -1) do
        delete :destroy, id: @schedule
      end

      assert_redirected_to schedules_path
    end
  end
end
