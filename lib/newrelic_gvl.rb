# frozen_string_literal: true

module NewrelicGvl
  class Error < StandardError; end
end

require_relative "newrelic_gvl/version"
require_relative "newrelic_gvl/sidekiq/server_middleware"
require_relative "newrelic_gvl/sidekiq/client_middleware"
require_relative "newrelic_gvl/rack/middleware"
