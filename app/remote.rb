#! /usr/bin/ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

def ssh_to(env)
  env_name = EnvUtils.get_env_name(env)
  CliUtils.show_and_run_command "ey ssh -e #{env_name}"
end

env = CliUtils.get_env_arg(:production)
ssh_to(env)