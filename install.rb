#! /usr/bin/ruby

["deploy","remote","run"].each do |command|
  full_path = ::File.expand_path("../app/#{command}.rb",__FILE__)
  line = "alias #{command}=\"#{full_path}\""
  command = "echo '#{line}' >> ~/.alias"
  system(command)
end
