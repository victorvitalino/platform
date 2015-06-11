require 'test_helper'

module Patrimony
  class DrivesControllerTest < ActionController::TestCase
    setup do
      @drife = drives(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:drives)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create drife" do
      assert_difference('Drive.count') do
        post :create, drife: { date_drive: @drife.date_drive, patrimony_id: @drife.patrimony_id, sector_id: @drife.sector_id, sector_old: @drife.sector_old, user_id: @drife.user_id, user_old: @drife.user_old }
      end

      assert_redirected_to drife_path(assigns(:drife))
    end

    test "should show drife" do
      get :show, id: @drife
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @drife
      assert_response :success
    end

    test "should update drife" do
      patch :update, id: @drife, drife: { date_drive: @drife.date_drive, patrimony_id: @drife.patrimony_id, sector_id: @drife.sector_id, sector_old: @drife.sector_old, user_id: @drife.user_id, user_old: @drife.user_old }
      assert_redirected_to drife_path(assigns(:drife))
    end

    test "should destroy drife" do
      assert_difference('Drive.count', -1) do
        delete :destroy, id: @drife
      end

      assert_redirected_to drives_path
    end
  end
end
