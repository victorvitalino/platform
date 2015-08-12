require 'test_helper'

module Juridical
  class AtividadesControllerTest < ActionController::TestCase
    setup do
      @atividade = juridical_atividades(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:atividades)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create atividade" do
      assert_difference('Atividade.count') do
        post :create, atividade: { action_type_id: @atividade.action_type_id, attachment: @atividade.attachment, complemet: @atividade.complemet, date_distribution: @atividade.date_distribution, days: @atividade.days, deadline: @atividade.deadline, document_type_id: @atividade.document_type_id, end_date: @atividade.end_date, local_instance_id: @atividade.local_instance_id, monitoring_type: @atividade.monitoring_type, status: @atividade.status, user_id: @atividade.user_id }
      end

      assert_redirected_to atividade_path(assigns(:atividade))
    end

    test "should show atividade" do
      get :show, id: @atividade
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @atividade
      assert_response :success
    end

    test "should update atividade" do
      patch :update, id: @atividade, atividade: { action_type_id: @atividade.action_type_id, attachment: @atividade.attachment, complemet: @atividade.complemet, date_distribution: @atividade.date_distribution, days: @atividade.days, deadline: @atividade.deadline, document_type_id: @atividade.document_type_id, end_date: @atividade.end_date, local_instance_id: @atividade.local_instance_id, monitoring_type: @atividade.monitoring_type, status: @atividade.status, user_id: @atividade.user_id }
      assert_redirected_to atividade_path(assigns(:atividade))
    end

    test "should destroy atividade" do
      assert_difference('Atividade.count', -1) do
        delete :destroy, id: @atividade
      end

      assert_redirected_to atividades_path
    end
  end
end
