require "simplecov"
require "byebug"
require "vcr"
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'whereabouts'

# Stubexternal services = see https://github.com/vcr/vcr
VCR.configure do |c|
  c.cassette_library_dir = "spec/cassettes"
  c.hook_into :webmock
  c.ignore_hosts "127.0.0.1"
  # c.allow_http_connections_when_no_cassette = true
end

Whereabouts.logger.level = Logger::WARN

RSpec.configure do |config|
  # These two settings work together to allow you to limit a spec run
  # to individual examples or groups you care about by tagging them with
  # `:focus` metadata. When nothing is tagged with `:focus`, all examples
  # get run.
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end
