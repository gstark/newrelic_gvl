require "test_helper"

describe NewrelicGvl::Rack::Middleware do
  it "calls the chained middleware" do
    middleware = NewrelicGvl::Rack::Middleware.new(->(env) { [200, {}, ["OK"]] })

    result = middleware.call({})

    _(result).must_equal [200, {}, ["OK"]]
  end

  it "Sends the wait time to NewRelic" do
    middleware = NewrelicGvl::Rack::Middleware.new(->(env) { [200, {}, ["OK"]] })

    GVLTools::LocalTimer.expects(:monotonic_time).returns(0.0).twice

    NewRelic::Agent.expects(:add_custom_attributes).with({gvl_wait: 0.0})

    middleware.call({})
  end
end
