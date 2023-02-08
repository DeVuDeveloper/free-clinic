# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module CodicaMed
  class Application < Rails::Application
    config.load_defaults 7.0
    config.eager_load_paths << root.join('lib')
    config.autoload_paths += %W(#{config.root}/app/services)
  end
end
