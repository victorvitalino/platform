require 'test_helper'

module Concourse
  class PagesControllerTest < ActionController::TestCase
    setup do
      @page = concourse_pages(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:pages)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create page" do
      assert_difference('Page.count') do
        post :create, page: { content: @page.content, project_id: @page.project_id, publish: @page.publish, slug: @page.slug, title: @page.title }
      end

      assert_redirected_to page_path(assigns(:page))
    end

    test "should show page" do
      get :show, id: @page
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @page
      assert_response :success
    end

    test "should update page" do
      patch :update, id: @page, page: { content: @page.content, project_id: @page.project_id, publish: @page.publish, slug: @page.slug, title: @page.title }
      assert_redirected_to page_path(assigns(:page))
    end

    test "should destroy page" do
      assert_difference('Page.count', -1) do
        delete :destroy, id: @page
      end

      assert_redirected_to pages_path
    end
  end
end
