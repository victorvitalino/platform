require 'test_helper'

module Patrimony
  class PatrimoniesControllerTest < ActionController::TestCase
    setup do
      @patrimony = patrimonies(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:patrimonies)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create patrimony" do
      assert_difference('Patrimony.count') do
        post :create, patrimony: { code_patrimony: @patrimony.code_patrimony, date_acquisition: @patrimony.date_acquisition, material_id: @patrimony.material_id, property_id: @patrimony.property_id, sector_id: @patrimony.sector_id, status: @patrimony.status, user_id: @patrimony.user_id }
      end

      assert_redirected_to patrimony_path(assigns(:patrimony))
    end

    test "should show patrimony" do
      get :show, id: @patrimony
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @patrimony
      assert_response :success
    end

    test "should update patrimony" do
      patch :update, id: @patrimony, patrimony: { code_patrimony: @patrimony.code_patrimony, date_acquisition: @patrimony.date_acquisition, material_id: @patrimony.material_id, property_id: @patrimony.property_id, sector_id: @patrimony.sector_id, status: @patrimony.status, user_id: @patrimony.user_id }
      assert_redirected_to patrimony_path(assigns(:patrimony))
    end

    test "should destroy patrimony" do
      assert_difference('Patrimony.count', -1) do
        delete :destroy, id: @patrimony
      end

      assert_redirected_to patrimonies_path
    end
  end
end
