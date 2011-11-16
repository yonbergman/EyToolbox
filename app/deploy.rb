#! /usr/bin/ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

def deploy(env,branch,migrate = false)
  env_name = EnvUtils.get_env_name(env)
  branch = GitUtils.current_branch if branch == :current
  migrate_text = migrate ? "" : "--no-migrate"
  puts "About to deploy"
  puts "   -e #{ColorUtil.colorize(env_name,:yellow)} -r #{ColorUtil.colorize(branch,:green)} #{migrate_text}"
  puts "                in 2 seconds..."
  sleep(2)
  CliUtils.show_and_run_command "ey deploy -e #{env_name} -r #{branch} #{migrate_text}"
end

env = CliUtils.get_env_arg
migrate = CliUtils.has_migration_arg
branch = CliUtils.get_remaining_arg
branch ||= :current
deploy(env,branch,migrate)