require 'test_helper'

module Attendance
  class AttendantsControllerTest < ActionController::TestCase
    setup do
      @attendant = attendance_attendants(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:attendants)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create attendant" do
      assert_difference('Attendant.count') do
        post :create, attendant: {  }
      end

      assert_redirected_to attendant_path(assigns(:attendant))
    end

    test "should show attendant" do
      get :show, id: @attendant
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @attendant
      assert_response :success
    end

    test "should update attendant" do
      patch :update, id: @attendant, attendant: {  }
      assert_redirected_to attendant_path(assigns(:attendant))
    end

    test "should destroy attendant" do
      assert_difference('Attendant.count', -1) do
        delete :destroy, id: @attendant
      end

      assert_redirected_to attendants_path
    end
  end
end
