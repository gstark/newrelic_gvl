require "gvltools"

module NewrelicGvl
  module Rack
    class Middleware
      def initialize(app)
        @app = app
      end

      def call(env)
        before = GVLTools::LocalTimer.monotonic_time
        @app.call(env).tap do |response|
          wait_in_ms = (GVLTools::LocalTimer.monotonic_time - before) / 1_000_000.0

          NewRelic::Agent.add_custom_attributes({gvl_wait: wait_in_ms})
        end
      end
    end
  end
end
