require 'test_helper'

module RegularizationSchedule
  class AgendasControllerTest < ActionController::TestCase
    setup do
      @agenda = regularization_schedule_agendas(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:agendas)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create agenda" do
      assert_difference('Agenda.count') do
        post :create, agenda: { city_id: @agenda.city_id, description: @agenda.description, end: @agenda.end, hour_end: @agenda.hour_end, hour_start: @agenda.hour_start, lunch: @agenda.lunch, lunch_attendants: @agenda.lunch_attendants, lunch_end: @agenda.lunch_end, lunch_start: @agenda.lunch_start, lunch_time_attendant: @agenda.lunch_time_attendant, publish: @agenda.publish, quantity_attendants: @agenda.quantity_attendants, start: @agenda.start, station_id: @agenda.station_id, time_attendant: @agenda.time_attendant, title: @agenda.title, validate: @agenda.validate, validate_sql: @agenda.validate_sql, validate_type: @agenda.validate_type }
      end

      assert_redirected_to agenda_path(assigns(:agenda))
    end

    test "should show agenda" do
      get :show, id: @agenda
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @agenda
      assert_response :success
    end

    test "should update agenda" do
      patch :update, id: @agenda, agenda: { city_id: @agenda.city_id, description: @agenda.description, end: @agenda.end, hour_end: @agenda.hour_end, hour_start: @agenda.hour_start, lunch: @agenda.lunch, lunch_attendants: @agenda.lunch_attendants, lunch_end: @agenda.lunch_end, lunch_start: @agenda.lunch_start, lunch_time_attendant: @agenda.lunch_time_attendant, publish: @agenda.publish, quantity_attendants: @agenda.quantity_attendants, start: @agenda.start, station_id: @agenda.station_id, time_attendant: @agenda.time_attendant, title: @agenda.title, validate: @agenda.validate, validate_sql: @agenda.validate_sql, validate_type: @agenda.validate_type }
      assert_redirected_to agenda_path(assigns(:agenda))
    end

    test "should destroy agenda" do
      assert_difference('Agenda.count', -1) do
        delete :destroy, id: @agenda
      end

      assert_redirected_to agendas_path
    end
  end
end
