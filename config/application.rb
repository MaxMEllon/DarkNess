require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Darkness
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.preferred_syntax = :sass
    config.sass.syntax = :sass

    config.i18n.default_locale = :ja

    config.generators do |g|
      g.template_engine = :slim
      g.helper          = false
      g.assets          = false
      g.test_framework  = 'rspec'
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end


    config.git_revision = `git log --abbrev-commit --pretty=oneline | head -1 | cut -d' ' -f1`
    config.autoload_paths += %W(#{config.root}/lib)
    config.active_record.raise_in_transactional_callbacks = true

    config.log_tags = [:remote_ip]

  end
end
