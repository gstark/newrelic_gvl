require "gvltools"

module NewrelicGvl
  module Sidekiq
    class Middleware
      include Sidekiq::ClientMiddleware if defined?(Sidekiq::ClientMiddleware)

      def call(_worker, _job, _queue, _redis_pool)
        before = GVLTools::LocalTimer.monotonic_time

        yield
      ensure
        wait_in_ms = (GVLTools::LocalTimer.monotonic_time - before) / 1_000_000.0

        NewRelic::Agent.add_custom_attributes({gvl_wait: wait_in_ms})
      end
    end
  end
end
