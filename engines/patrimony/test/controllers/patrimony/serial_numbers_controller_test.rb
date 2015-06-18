require 'test_helper'

module Patrimony
  class SerialNumbersControllerTest < ActionController::TestCase
    setup do
      @serial_number = serial_numbers(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:serial_numbers)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create serial_number" do
      assert_difference('SerialNumber.count') do
        post :create, serial_number: { good_id: @serial_number.good_id, name: @serial_number.name, number: @serial_number.number, status: @serial_number.status }
      end

      assert_redirected_to serial_number_path(assigns(:serial_number))
    end

    test "should show serial_number" do
      get :show, id: @serial_number
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @serial_number
      assert_response :success
    end

    test "should update serial_number" do
      patch :update, id: @serial_number, serial_number: { good_id: @serial_number.good_id, name: @serial_number.name, number: @serial_number.number, status: @serial_number.status }
      assert_redirected_to serial_number_path(assigns(:serial_number))
    end

    test "should destroy serial_number" do
      assert_difference('SerialNumber.count', -1) do
        delete :destroy, id: @serial_number
      end

      assert_redirected_to serial_numbers_path
    end
  end
end
