require 'test_helper'

module Helpdesk
  class OrderServiceTechnicalControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
    end

  end
end
