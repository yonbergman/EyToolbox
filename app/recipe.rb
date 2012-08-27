#! /usr/bin/ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

def apply_recipe(env_name)
  puts "Uploading Recipes to #{ColorUtil.colorize(env_name,:yellow)}"
  CliUtils.show_and_run_command "ey recipe upload -e #{env_name}"
  puts "Starting Apply Recipe to #{ColorUtil.colorize(env_name,:yellow)}"
  CliUtils.show_and_run_command "ey recipe apply -e #{env_name}"
end


unless EnvUtils.current_path.include? "ey-cloud-recipes"
  puts ColorUtil.colorize("Must run from the /ey-cloud-recipes folder",:red)
  abort()
end


env = CliUtils.get_env_arg(:staging)
branch_name = GitUtils.current_branch
env_name = EnvUtils.get_env_for_project(branch_name, env)

if env_name.nil? or env_name.empty?
  puts "No env found for #{branch_name}::#{env}!"
  abort
end

apply_recipe(env_name)


