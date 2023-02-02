# frozen_string_literal: true

module NewrelicGvl
  class Error < StandardError; end
end

require_relative "newrelic_gvl/version"
require_relative "newrelic_gvl/sidekiq/middleware"
require_relative "newrelic_gvl/rack/middleware"
