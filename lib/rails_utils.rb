module RailsUtils

  def self.rails_run_command
    self.rails2? ? self.rails2_run : self.rails3_run
  end

  private
  
  def self.rails2?
    File.exist?("#{self.current_dir}/script/server")
  end

  def self.rails2_run
    "#{self.current_dir}/script/server -p"
  end

  def self.rails3_run
    "#{self.current_dir}/script/rails server --debugger -p"
  end

  def self.current_dir
    `pwd -P`.strip
  end

end