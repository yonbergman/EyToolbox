module CliUtils
  
  def self.error(msg)
    puts "ERROR: #{msg}"
    exit
  end

  def self.show_and_run_command(command)
    puts command
    system(command)
  end

  def self.get_env_arg(default = :staging)
    staging = self.has_argument(["staging","stage"]) ? :staging : nil
    production = self.has_argument(["production","prod"]) ? :production : nil
    demo = self.has_argument(["demo"]) ? :demo : nil
    staging || demo || production || default
  end

  def self.has_migration_arg
    self.has_argument(["migrate","migration"])
  end

  def self.get_remaining_arg
    self.args.last
  end

  def self.get_port_arg
    self.args.each do |arg|
      return arg if arg =~ /\d+/
    end
    nil
  end

  def self.get_message_arg
    index = self.args.index("-m")
    if not index.nil? and index + 1 < self.args.length
      self.args.delete_at(index)
      return self.args.delete_at(index)
    end
    nil
  end

  private

  def self.has_argument(list_of_opts)
    list_of_opts.each do |word|
      return true unless self.args.delete(word).nil?
    end
    false
  end

  def self.args
    @args ||= ARGV.clone.map(&:downcase)
  end

end