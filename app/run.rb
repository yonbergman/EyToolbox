#! /usr/bin/ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

port = CliUtils.get_port_arg || EnvUtils.get_port
puts "Running Server on port #{ColorUtil.colorize(port,:green)}"

CliUtils.show_and_run_command("#{RailsUtils.rails_run_command} #{port}")