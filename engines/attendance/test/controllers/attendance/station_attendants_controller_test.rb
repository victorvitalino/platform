require 'test_helper'

module Attendance
  class StationAttendantsControllerTest < ActionController::TestCase
    setup do
      @station_attendant = attendance_station_attendants(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:station_attendants)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create station_attendant" do
      assert_difference('StationAttendant.count') do
        post :create, station_attendant: {  }
      end

      assert_redirected_to station_attendant_path(assigns(:station_attendant))
    end

    test "should show station_attendant" do
      get :show, id: @station_attendant
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @station_attendant
      assert_response :success
    end

    test "should update station_attendant" do
      patch :update, id: @station_attendant, station_attendant: {  }
      assert_redirected_to station_attendant_path(assigns(:station_attendant))
    end

    test "should destroy station_attendant" do
      assert_difference('StationAttendant.count', -1) do
        delete :destroy, id: @station_attendant
      end

      assert_redirected_to station_attendants_path
    end
  end
end
