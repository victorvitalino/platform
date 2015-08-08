module Portal
  class Engine < ::Rails::Engine
    isolate_namespace Portal
    config.to_prepare do
      ApplicationController.helper(ActionView::Helpers::ApplicationHelper)
    end
  end
end
