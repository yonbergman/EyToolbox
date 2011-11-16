module ColorUtil
  COLORS = {
      :green => 32, :red => 31, :yellow => 33, :blue => 34
  }

  def self.colorize(text,colorcode)
    code = COLORS[colorcode]
    return text if code.nil?
    "\e[#{code}m#{text}\e[0m"
  end

end
