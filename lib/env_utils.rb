require "yaml"
module EnvUtils
  YAML_FILE = YAML.load_file(::File.expand_path('../../config.yml', __FILE__))
  APPS = YAML_FILE["apps"]

  def self.get_env_for_project(project, env)
    APPS[project.to_s][env.to_s]
  end

  def self.get_env_name(env)
    self.get_env[env.to_s]
  end

  def self.get_port
    self.get_env['port']
  rescue
    3000
  end

  def self.current_project
    current_path.split('/').last.downcase.to_s
  end

  def self.ey_env
    self.get_env["env"] || self.current_project
  end

  def self.github_account
    YAML_FILE["github"]
  end

  def self.current_path
    `pwd -P`.strip
  end

  private

  def self.get_env
    APPS[self.current_project]
  end

end
