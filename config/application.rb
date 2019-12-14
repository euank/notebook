require_relative 'boot'

require 'rails/all'

DEVELOPMENT_RAILS_GROUPS = 'web,worker'
if ENV['RAILS_GROUPS'].blank?
  ENV['RAILS_GROUPS'] = DEVELOPMENT_RAILS_GROUPS
  warn "RAILS_GROUPS is unset; defaulting to #{DEVELOPMENT_RAILS_GROUPS}"
elsif ENV['RAILS_GROUPS'] != DEVELOPMENT_RAILS_GROUPS
  warn "RAILS_GROUPS is set to #{ENV['RAILS_GROUPS']} instead of #{DEVELOPMENT_RAILS_GROUPS}"
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Notebook
  class Application < Rails::Application
    # Rails 6 should be autoloading everything under app/ now
    # config.autoload_paths += Dir[Rails.root.join('app', 'models', '{*/}')]
    # config.autoload_paths += Dir[Rails.root.join('app', 'services', '{*/}')]

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.active_job.queue_adapter = :sidekiq
  end
end
