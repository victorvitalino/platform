# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( material.css portal.css print.css)
Rails.application.config.assets.precompile += %w( remark.css remark.js print.css)
Rails.application.config.assets.precompile += %w( material.js portal.js )
Rails.application.config.assets.precompile += %w( portal/img/logo_codhab.png )
Rails.application.config.assets.precompile += %w( footer-concursos.png )

Rails.application.config.assets.precompile += %w( shared/extranet.js shared/extranet.css )
Rails.application.config.assets.precompile += %w( shared/portal.js shared/portal.css )
