require 'test_helper'

module Cms
  class PageCategoriesControllerTest < ActionController::TestCase
    setup do
      @page_category = page_categories(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:page_categories)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create page_category" do
      assert_difference('PageCategory.count') do
        post :create, page_category: { name: @page_category.name, status: @page_category.status }
      end

      assert_redirected_to page_category_path(assigns(:page_category))
    end

    test "should show page_category" do
      get :show, id: @page_category
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @page_category
      assert_response :success
    end

    test "should update page_category" do
      patch :update, id: @page_category, page_category: { name: @page_category.name, status: @page_category.status }
      assert_redirected_to page_category_path(assigns(:page_category))
    end

    test "should destroy page_category" do
      assert_difference('PageCategory.count', -1) do
        delete :destroy, id: @page_category
      end

      assert_redirected_to page_categories_path
    end
  end
end
