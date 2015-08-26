require 'test_helper'

module Concourse
  class ProjectsControllerTest < ActionController::TestCase
    setup do
      @project = concourse_projects(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:projects)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create project" do
      assert_difference('Project.count') do
        post :create, project: { apresentation: @project.apresentation, consultation: @project.consultation, end: @project.end, image_footer: @project.image_footer, image_header: @project.image_header, image_logo: @project.image_logo, image_slider: @project.image_slider, mini_description: @project.mini_description, publish: @project.publish, slider: @project.slider, start: @project.start, status: @project.status, title: @project.title }
      end

      assert_redirected_to project_path(assigns(:project))
    end

    test "should show project" do
      get :show, id: @project
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @project
      assert_response :success
    end

    test "should update project" do
      patch :update, id: @project, project: { apresentation: @project.apresentation, consultation: @project.consultation, end: @project.end, image_footer: @project.image_footer, image_header: @project.image_header, image_logo: @project.image_logo, image_slider: @project.image_slider, mini_description: @project.mini_description, publish: @project.publish, slider: @project.slider, start: @project.start, status: @project.status, title: @project.title }
      assert_redirected_to project_path(assigns(:project))
    end

    test "should destroy project" do
      assert_difference('Project.count', -1) do
        delete :destroy, id: @project
      end

      assert_redirected_to projects_path
    end
  end
end
