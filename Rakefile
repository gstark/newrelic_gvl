# frozen_string_literal: true

require "bundler/gem_tasks"
require "minitest/test_task"
require "standard/rake"

Minitest::TestTask.create(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.warning = false
  t.test_globs = FileList["test/test_helper.rb", "test/**/*_spec.rb"]
end

task default: :test
