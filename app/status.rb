#! /usr/bin/ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

def show_status(env)
  env_name = EnvUtils.get_env_name(env)
  puts "Showing Status of #{ColorUtil.colorize(env_name,:yellow)}"
  CliUtils.show_and_run_command "ey status -e #{env_name}"
end

env = CliUtils.get_env_arg(:production)
show_status(env)