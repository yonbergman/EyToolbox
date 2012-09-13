#!/usr/bin/env ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

def deploy(env,branch,migrate = false, message = nil)
  env_name = EnvUtils.get_env_name(env)
  migrate_text = migrate ? "--migrate" : "--no-migrate"
  message_text = message.nil? ? "" : "--extra-deploy-hook-options message:\"#{message}\""
  puts "About to deploy"
  puts "   -e #{ColorUtil.colorize(env_name,:yellow)} -r #{ColorUtil.colorize(branch,:green)} #{migrate_text} #{message_text}"
  puts "                in 2 seconds..."
  sleep(2)
  CliUtils.show_and_run_command "ey deploy -e #{env_name} -r #{branch} #{migrate_text} #{message_text}"
end

def tag(env, branch, migrate, message)
  revision = GitUtils.revision_in_origin(branch)
  GitUtils.create_tag(env, revision)
  GitUtils.create_message_tag(env, revision, branch, migrate, message)
  puts "Tagged release"
end

env = CliUtils.get_env_arg
migrate = CliUtils.has_migration_arg
message = CliUtils.get_message_arg
branch = CliUtils.get_remaining_arg || GitUtils.current_branch
deploy(env,branch,migrate, message)
tag(env, branch, migrate, message)