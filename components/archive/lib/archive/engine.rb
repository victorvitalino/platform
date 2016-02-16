module Archive
  class Engine < ::Rails::Engine
    isolate_namespace Archive
        
    config.generators do |g|
      g.template_engine :haml
      g.templates.unshift File::expand_path('../../templates', __FILE__)
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
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
