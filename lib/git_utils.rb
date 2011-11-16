module GitUtils
  
  def self.current_branch
    `git branch 2> /dev/null | sed -e '/^[^*]/d'`.gsub("*","").strip
  end

end