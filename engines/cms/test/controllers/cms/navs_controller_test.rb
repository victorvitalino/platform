require 'test_helper'

module Cms
  class NavsControllerTest < ActionController::TestCase
    setup do
      @nav = navs(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:navs)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create nav" do
      assert_difference('Nav.count') do
        post :create, nav: { category_id: @nav.category_id, link_external: @nav.link_external, link_page_id: @nav.link_page_id, link_post_id: @nav.link_post_id, name: @nav.name, order: @nav.order, publish: @nav.publish, target: @nav.target }
      end

      assert_redirected_to nav_path(assigns(:nav))
    end

    test "should show nav" do
      get :show, id: @nav
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @nav
      assert_response :success
    end

    test "should update nav" do
      patch :update, id: @nav, nav: { category_id: @nav.category_id, link_external: @nav.link_external, link_page_id: @nav.link_page_id, link_post_id: @nav.link_post_id, name: @nav.name, order: @nav.order, publish: @nav.publish, target: @nav.target }
      assert_redirected_to nav_path(assigns(:nav))
    end

    test "should destroy nav" do
      assert_difference('Nav.count', -1) do
        delete :destroy, id: @nav
      end

      assert_redirected_to navs_path
    end
  end
end
