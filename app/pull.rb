#!/usr/bin/env ruby
require ::File.expand_path('../../lib/utils',  __FILE__)

if CliUtils.command_exists? 'hub'
  branch = GitUtils.current_branch
  CliUtils.show_and_run_command("hub pull-request -h TheGiftsProject:#{branch}")
else
  puts "You need to install #{ColorUtil.colorize('hub',:green)} please run #{ColorUtil.colorize('brew install hub',:blue)}"
end
