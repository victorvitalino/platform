require 'test_helper'

module Candidate
  class InheritorsControllerTest < ActionController::TestCase
    setup do
      @inheritor = candidate_inheritors(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:inheritors)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create inheritor" do
      assert_difference('Inheritor.count') do
        post :create, inheritor: { born: @inheritor.born, cadastre_id: @inheritor.cadastre_id, civil_state_id: @inheritor.civil_state_id, cpf: @inheritor.cpf, gender: @inheritor.gender, inheritor_type_id: @inheritor.inheritor_type_id, name: @inheritor.name, observation: @inheritor.observation, percentage: @inheritor.percentage, rg: @inheritor.rg, single_name: @inheritor.single_name }
      end

      assert_redirected_to inheritor_path(assigns(:inheritor))
    end

    test "should show inheritor" do
      get :show, id: @inheritor
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @inheritor
      assert_response :success
    end

    test "should update inheritor" do
      patch :update, id: @inheritor, inheritor: { born: @inheritor.born, cadastre_id: @inheritor.cadastre_id, civil_state_id: @inheritor.civil_state_id, cpf: @inheritor.cpf, gender: @inheritor.gender, inheritor_type_id: @inheritor.inheritor_type_id, name: @inheritor.name, observation: @inheritor.observation, percentage: @inheritor.percentage, rg: @inheritor.rg, single_name: @inheritor.single_name }
      assert_redirected_to inheritor_path(assigns(:inheritor))
    end

    test "should destroy inheritor" do
      assert_difference('Inheritor.count', -1) do
        delete :destroy, id: @inheritor
      end

      assert_redirected_to inheritors_path
    end
  end
end
