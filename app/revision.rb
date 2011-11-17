#! /usr/bin/ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

project = EnvUtils.current_project
env = CliUtils.get_env_arg(:production)
env_name = EnvUtils.get_env_name(env)

puts "Asking server for current revision of #{ColorUtil.colorize("#{project}:#{env}",:green)}"

log_line = `ey ssh "cat #{project}-deploy.log" -e #{env_name} | grep "git checkout"`
revision = log_line.scan(/'(\w+)'/).flatten.first
puts "Revision: #{ColorUtil.colorize(revision,:yellow)}"
github_link = "https://github.com/#{EnvUtils.github_account}/#{project}/commit/#{revision}"
puts ""
puts github_link