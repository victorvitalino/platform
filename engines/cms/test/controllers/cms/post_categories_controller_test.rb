require 'test_helper'

module Cms
  class PostCategoriesControllerTest < ActionController::TestCase
    setup do
      @post_category = post_categories(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:post_categories)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create post_category" do
      assert_difference('PostCategory.count') do
        post :create, post_category: { name: @post_category.name, status: @post_category.status }
      end

      assert_redirected_to post_category_path(assigns(:post_category))
    end

    test "should show post_category" do
      get :show, id: @post_category
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @post_category
      assert_response :success
    end

    test "should update post_category" do
      patch :update, id: @post_category, post_category: { name: @post_category.name, status: @post_category.status }
      assert_redirected_to post_category_path(assigns(:post_category))
    end

    test "should destroy post_category" do
      assert_difference('PostCategory.count', -1) do
        delete :destroy, id: @post_category
      end

      assert_redirected_to post_categories_path
    end
  end
end
