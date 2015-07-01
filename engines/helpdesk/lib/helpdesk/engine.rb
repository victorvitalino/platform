module Helpdesk
  class Engine < ::Rails::Engine
    isolate_namespace Helpdesk
    config.generators do |g|
      g.template_engine :haml
      g.templates.unshift File::expand_path('../../templates', __FILE__)
    end
    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s)
        config.paths["db/migrate"].expanded.each do |p|
          app.config.paths["db/migrate"] << p
        end
      end
    end
  end
end
