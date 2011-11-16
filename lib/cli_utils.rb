module CliUtils
  
  def self.error(msg)
    puts "ERROR: #{msg}"
    exit
  end

  def self.show_and_run_command(command)
    puts command
    #system(command)
  end

  def self.get_env_arg(default = :staging)
    staging = self.has_argument(["staging","stage"]) ? :staging : nil
    production = self.has_argument(["production","prod"]) ? :production : nil
    staging || production || default
  end

  def self.has_migration_arg
    self.has_argument(["migrate","migration"])
  end

  def self.get_remaining_arg
    self.args.last
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