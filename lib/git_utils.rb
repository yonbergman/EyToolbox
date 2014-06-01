module GitUtils
  
  def self.current_branch
    `git branch 2> /dev/null | sed -e '/^[^*]/d'`.gsub("*","").strip
  end

  def self.create_tag(name, revision)
	  `git tag -f #{name} #{revision}`
  end

  def self.create_message_tag(env, revision, branch, migrate, message)
    if env == :production
      tag_name = Time.now.strftime "DEPLOY_%Y%m%d-%H%M%S"
      branch = branch + "+migrate" if migrate
      message = "(#{branch}) #{message}"
      `git tag -f #{tag_name} -m "#{message}" #{revision} `
      `git push origin #{tag_name}`
    end
  end

  def self.revision_in_origin(branch)
  	`git log origin/#{branch} --pretty=format:'%H' -n 1` 
  end

  def self.current_github_project
    first_line = `git remote -v | grep 'origin'`.lines.first
    matcher = /github.com[:\/].+\/([^\s\.]+)/.match(first_line)
    return EnvUtils.current_project if matcher.nil?
    matcher[1]
  end

end