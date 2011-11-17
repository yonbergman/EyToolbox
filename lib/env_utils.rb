require "yaml"
module EnvUtils
  YAML_FILE = YAML.load_file(::File.expand_path('../../config.yml', __FILE__))
  APPS = YAML_FILE["apps"]

  def self.get_env_name(env)
    self.get_env[env.to_s]
  end

  def self.get_port
    self.get_env['port']
  end

  def self.current_project
    `pwd -P`.strip.split('/').last.downcase.to_s
  end

  def self.github_account
    YAML_FILE["github"]
  end

  private

  def self.get_env
    APPS[self.current_project]
  end

end
