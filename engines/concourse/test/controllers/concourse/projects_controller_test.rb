require 'test_helper'

module Concourse
  class ProjectsControllerTest < ActionController::TestCase
    setup do
      @project = projects(:one)
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
        post :create, project: { background: @project.background, description: @project.description, end: @project.end, hour_end: @project.hour_end, logo: @project.logo, name: @project.name, project_category_id: @project.project_category_id, start: @project.start, status: @project.status }
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
      patch :update, id: @project, project: { background: @project.background, description: @project.description, end: @project.end, hour_end: @project.hour_end, logo: @project.logo, name: @project.name, project_category_id: @project.project_category_id, start: @project.start, status: @project.status }
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
