#! /usr/bin/ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

project = EnvUtils.current_project
env = CliUtils.get_env_arg(:production)
env_name = EnvUtils.get_env_name(env)

puts "Asking server for current revision of #{ColorUtil.colorize("#{project}:#{env}",:green)}"

log_lines = `ey ssh "cat #{EnvUtils.ey_env}-deploy.log" -e #{env_name} | grep "Finished deploy at\\|git checkout"`
revision = log_lines.scan(/git checkout -q '(\w+)'/).flatten.first
if revision.nil? or revision.empty?
  CliUtils.error("No revision found")
end
puts "Revision: #{ColorUtil.colorize(revision,:yellow)}"
GitUtils.create_tag(env, revision)
puts "created tag"

date = log_lines.scan(/Finished deploy at (.+)/).flatten.first
puts "Last Deployed at #{date}" unless date.nil? or date.empty?

github_link = "https://github.com/#{EnvUtils.github_account}/#{project}/commit/#{revision}"
puts ""
puts github_link

needs_migration = `git diff --name-only HEAD #{revision} | grep db/migrate`
unless needs_migration.empty?
  puts ColorUtil.colorize("\nNeeds to migrate!", :red)
  puts needs_migration
end