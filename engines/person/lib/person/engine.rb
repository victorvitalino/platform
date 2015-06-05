module Person
  class Engine < ::Rails::Engine
    isolate_namespace Person
  end
end
