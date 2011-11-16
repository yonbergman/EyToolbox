require "yaml"
module EnvUtils
  APPS = YAML.load_file(::File.expand_path('../../config.yml',  __FILE__))["apps"]

  def self.get_env_name(env)
    self.get_env[env.to_s]
  end

  def self.get_port
    self.get_env['port']
  end

  private

  def self.get_env
    APPS[self.current_folder.to_s]
  end

  def self.current_folder
    `pwd -P`.strip.split('/').last.downcase
  end

end
