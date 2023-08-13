require "test_helper"

describe NewrelicGvl::Sidekiq::ServerMiddleware do
  it "Yields to the middleware" do
    middleware = NewrelicGvl::Sidekiq::ServerMiddleware.new

    GVLTools::LocalTimer.expects(:monotonic_time).returns(0.0).twice

    value = 0

    middleware.call(nil, nil, nil) do
      value = 42
    end

    _(value).must_equal(42)
  end

  it "Sends the wait time to NewRelic" do
    middleware = NewrelicGvl::Sidekiq::ServerMiddleware.new

    GVLTools::LocalTimer.expects(:monotonic_time).returns(0.0).twice

    NewRelic::Agent.expects(:add_custom_attributes).with({gvl_wait: 0.0})

    middleware.call(nil, nil, nil) do
      # Nothing to do
    end
  end
end
