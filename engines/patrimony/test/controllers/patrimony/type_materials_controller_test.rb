require 'test_helper'

module Patrimony
  class TypeMaterialsControllerTest < ActionController::TestCase
    setup do
      @type_material = type_materials(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:type_materials)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create type_material" do
      assert_difference('TypeMaterial.count') do
        post :create, type_material: { description: @type_material.description, life_cycle: @type_material.life_cycle, name: @type_material.name, percentage: @type_material.percentage, status: @type_material.status }
      end

      assert_redirected_to type_material_path(assigns(:type_material))
    end

    test "should show type_material" do
      get :show, id: @type_material
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @type_material
      assert_response :success
    end

    test "should update type_material" do
      patch :update, id: @type_material, type_material: { description: @type_material.description, life_cycle: @type_material.life_cycle, name: @type_material.name, percentage: @type_material.percentage, status: @type_material.status }
      assert_redirected_to type_material_path(assigns(:type_material))
    end

    test "should destroy type_material" do
      assert_difference('TypeMaterial.count', -1) do
        delete :destroy, id: @type_material
      end

      assert_redirected_to type_materials_path
    end
  end
end
