#! /usr/bin/ruby
require ::File.expand_path('../../lib/utils',  __FILE__)


CliUtils.show_and_run_command("#{RailsUtils.rails_run_command} #{EnvUtils.get_port}")