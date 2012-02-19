module GitUtils
  
  def self.current_branch
    `git branch 2> /dev/null | sed -e '/^[^*]/d'`.gsub("*","").strip
  end

  def self.create_tag(name, revision)
  	`git tag -d #{name}`
	`git tag #{name} #{revision}`
  end

  def self.revision_in_origin(branch)
  	`git log origin/#{branch} --pretty=format:'%H' -n 1` 
  end

end