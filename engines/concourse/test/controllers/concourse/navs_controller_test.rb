require 'test_helper'

module Concourse
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
        post :create, nav: { link: @nav.link, page_action: @nav.page_action, page_id: @nav.page_id, publish: @nav.publish, target: @nav.target, type_action: @nav.type_action }
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
      patch :update, id: @nav, nav: { link: @nav.link, page_action: @nav.page_action, page_id: @nav.page_id, publish: @nav.publish, target: @nav.target, type_action: @nav.type_action }
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
