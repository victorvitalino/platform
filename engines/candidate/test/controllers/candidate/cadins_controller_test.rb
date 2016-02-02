require 'test_helper'

module Candidate
  class CadinsControllerTest < ActionController::TestCase
    setup do
      @cadin = candidate_cadins(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:cadins)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create cadin" do
      assert_difference('Cadin.count') do
        post :create, cadin: { address: @cadin.address, born: @cadin.born, cep: @cadin.cep, city_id: @cadin.city_id, cpf: @cadin.cpf, distribution_date: @cadin.distribution_date, espolio: @cadin.espolio, freedup: @cadin.freedup, name: @cadin.name, number_control: @cadin.number_control, observation: @cadin.observation, occurrence_cadin_id: @cadin.occurrence_cadin_id, percentage: @cadin.percentage, place_birth: @cadin.place_birth, process: @cadin.process, rg: @cadin.rg, signed_instrument_id: @cadin.signed_instrument_id, uf_born: @cadin.uf_born }
      end

      assert_redirected_to cadin_path(assigns(:cadin))
    end

    test "should show cadin" do
      get :show, id: @cadin
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @cadin
      assert_response :success
    end

    test "should update cadin" do
      patch :update, id: @cadin, cadin: { address: @cadin.address, born: @cadin.born, cep: @cadin.cep, city_id: @cadin.city_id, cpf: @cadin.cpf, distribution_date: @cadin.distribution_date, espolio: @cadin.espolio, freedup: @cadin.freedup, name: @cadin.name, number_control: @cadin.number_control, observation: @cadin.observation, occurrence_cadin_id: @cadin.occurrence_cadin_id, percentage: @cadin.percentage, place_birth: @cadin.place_birth, process: @cadin.process, rg: @cadin.rg, signed_instrument_id: @cadin.signed_instrument_id, uf_born: @cadin.uf_born }
      assert_redirected_to cadin_path(assigns(:cadin))
    end

    test "should destroy cadin" do
      assert_difference('Cadin.count', -1) do
        delete :destroy, id: @cadin
      end

      assert_redirected_to cadins_path
    end
  end
end
