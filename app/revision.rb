#!/usr/bin/env ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

project = EnvUtils.current_project
env = CliUtils.get_env_arg(:production)
env_name = EnvUtils.get_env_name(env)

puts "Asking server for current revision of #{ColorUtil.colorize("#{project}:#{env}",:green)}"

status = `ey status -e #{env_name} | grep "Started at\\|Commit"`
revision = status.match(/Commit:\s+(\w+)/)[1]
if revision.nil? or revision.empty?
  CliUtils.error("No revision found")
end
puts "Revision: #{ColorUtil.colorize(revision,:yellow)}"

date = status.match(/Started at:\s+(.+)/)[1]
puts "Last Deployed at #{date}" unless date.nil? or date.empty?

github_project = GitUtils.current_github_project
github_link = "https://github.com/#{EnvUtils.github_account}/#{github_project}/commit/#{revision}"
puts ""
puts github_link

head = GitUtils.current_branch
github_compare_link = "https://github.com/#{EnvUtils.github_account}/#{github_project}/compare/#{revision}...#{head}"
puts ""
puts "Compare: "
puts github_compare_link

needs_migration = `git diff --name-only HEAD #{revision} | grep db/migrate`
unless needs_migration.empty?
  puts ColorUtil.colorize("\nNeeds to migrate!", :red)
  puts needs_migration
end