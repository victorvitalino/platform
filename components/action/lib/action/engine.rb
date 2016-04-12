module Action
  class Engine < ::Rails::Engine
    isolate_namespace Action
  end
end
