class Rubo
  def self.right_spaces(name, line, num)
    "#{name} line:#{num + 1} 'Right blank space(s) in the line.'\n" if line.match(/\s{2,}$/)
  end

  def self.blank_line(name, line, num)
    "#{name} line:#{num + 1} 'Blank line at the start of the script'\n" if line.match(/^\n/)
  end

  def self.semicolon(name, line, num)
    "#{name} line:#{num + 1} 'Semicolon is not neccesary'\n" if line.match(/;$/)
  end

  def self.nav_operator(name, line, num)
    "#{name} line:#{num + 1} 'No space required between navigation operator'\n" if line.match(/\ &.|&.\ /)
  end

  def self.space_between_elements(name, line, num)
    if line.match(/\[\w|\w\]/)
      "#{name} line:#{num + 1} 'Space required between open/close keys and first/last element'\n"
    end
    "#{name} line:#{num + 1} 'Space required between separator and array element'\n" if line.match(/\[.*,\w.*\]/)
  end

  def self.exponent(name, line, num)
    "#{name} line:#{num + 1} 'No space required between an exponent operator'\n" if line.match(/\ \*\*|\*\*\ /)
  end
end
