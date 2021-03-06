if RUBY_VERSION > "2.2"
  # Coverage - Keep these two lines at the top of this file
  require 'simplecov'
  require 'coveralls'
  SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter, Coveralls::SimpleCov::Formatter]
  SimpleCov.start do
    minimum_coverage 46
    refuse_coverage_drop
    track_files "lib/**/*.rb"
    add_filter '/test/'
  end
end

require File.join(File.dirname(__FILE__), './task_helper.rb')
require 'minitest/autorun'
require 'minitest/spec'
require 'mocha/setup'
require 'hammer_cli'
require 'hammer_cli_foreman/commands'

KATELLO_VERSION = Gem::Version.new(ENV['TEST_API_VERSION'] || '3.0')

HammerCLIForeman.stubs(:resource_config).returns(
  :apidoc_cache_dir => 'test/data/' + KATELLO_VERSION.to_s,
  :apidoc_cache_name => 'foreman_api',
  :dry_run => true
)

require 'hammer_cli_katello'
