require 'test_helper'

module Cms
  class GalleriesControllerTest < ActionController::TestCase
    setup do
      @gallery = cms_galleries(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:galleries)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create gallery" do
      assert_difference('Gallery.count') do
        post :create, gallery: { content: @gallery.content, photo: @gallery.photo, status: @gallery.status, thumbnail: @gallery.thumbnail, title: @gallery.title }
      end

      assert_redirected_to gallery_path(assigns(:gallery))
    end

    test "should show gallery" do
      get :show, id: @gallery
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @gallery
      assert_response :success
    end

    test "should update gallery" do
      patch :update, id: @gallery, gallery: { content: @gallery.content, photo: @gallery.photo, status: @gallery.status, thumbnail: @gallery.thumbnail, title: @gallery.title }
      assert_redirected_to gallery_path(assigns(:gallery))
    end

    test "should destroy gallery" do
      assert_difference('Gallery.count', -1) do
        delete :destroy, id: @gallery
      end

      assert_redirected_to galleries_path
    end
  end
end
