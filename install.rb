#! /usr/bin/ruby

["deploy","remote","run","revision"].each do |command|
  full_path = ::File.expand_path("../app/#{command}.rb",__FILE__)
  line = "alias #{command}=\"#{full_path}\""
  command = "echo '#{line}' >> ~/.alias"
  system(command)
end
echo "done :)"
echo "Wrote all the commands into your .alias file, make sure that you have this command in your .bashrc/.bash_profile"
echo "'source ~/.alias'"
echo "If you don't have it add it to the end of the file"