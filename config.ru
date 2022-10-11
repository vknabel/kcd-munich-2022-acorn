# This file is used by Rack-based servers to start the application.

require_relative "config/environment"


Rails.application.configure do
    config.hosts << "*.local.on-acorn.io"
end
run Rails.application
Rails.application.load_server

