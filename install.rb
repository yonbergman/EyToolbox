#!/usr/bin/env ruby

tools_file_full_path = ::File.expand_path(__FILE__).gsub("install.rb",".tools")
tools_file = File.open(tools_file_full_path, "w+")
Dir.glob("./app/*.rb").each do |app|
  file_name = File.split(app).last()
  command = file_name[0..-4]
  full_path = ::File.expand_path("../app/#{command}.rb",__FILE__)
  tools_file.write "alias #{command}=\"#{full_path}\"\n"
end
tools_file.close()
puts "Created .tools file"

profile = [".zshrc", ".zshenv",".alias", ".bash_profile", ".bashrc"].find do |file|
  full_file = File.expand_path("~/#{file}")
  File.exists? full_file
end

line = "source #{tools_file_full_path}"

profile_full_path = File.expand_path("~/#{profile}")
if File.read(profile_full_path).include? line
  added = false
else
  system("echo '#{line}' >> ~/#{profile}")
  added = true
end
system(line)

if added
  puts "Linked the .tools file into your #{profile} file and ran source to include it into current sesion :) enjoy"
else
  puts ".tools already linked in your #{profile} file - So I just ran source on it to update to latest tools"
end

config_demo_file = ::File.expand_path(__FILE__).gsub("install.rb","config.example.yml")
config_file = ::File.expand_path(__FILE__).gsub("install.rb","config.yml")
unless File.exists? config_file
  system("cp '#{config_demo_file}' '#{config_file}'")
  puts "Created initial config file"
end
