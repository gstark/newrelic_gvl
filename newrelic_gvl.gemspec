# frozen_string_literal: true

require_relative "lib/newrelic_gvl/version"

Gem::Specification.new do |spec|
  spec.name = "newrelic_gvl"
  spec.version = NewrelicGvl::VERSION
  spec.authors = ["Gavin Stark"]
  spec.email = ["gavin@gstark.com"]

  spec.summary = "NewRelic middleware that measures time spent waiting on the GVL"
  spec.description = "NewRelic middleware that measures time spent waiting on the GVL"
  spec.homepage = "https://github.com/gstark"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/gstark"
  spec.metadata["changelog_uri"] = "https://github.com/gstark"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gvltools", "> 0"
  spec.add_dependency "newrelic_rpm", "> 0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
