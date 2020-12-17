class Rubo
  def self.run(directory)
    directory.each do |i|
      script = File.open(i)
      script.each_with_index do |line, j|
        right_spaces(i, line, j)
        blank_line(i, line, j)
        semicolon(i, line, j)
        nav_operator(i, line, j)
        space_between_elements(i, line, j)
        exponent(i, line, j)
      end
    end
  end

  def self.right_spaces(name, line, num)
    puts "#{name} line:#{num + 1} 'Right blank space(s) in the line.'" if line.match(/\s{2,}$/)
  end

  def self.blank_line(name, line, num)
    puts "#{name} line:#{num + 1} 'Blank line at the start of the script'" if line.match(/^\n/)
  end

  def self.semicolon(name, line, num)
    puts "#{name} line:#{num + 1} 'Semicolon is not neccesary'" if line.match(/;$/)
  end

  def self.nav_operator(name, line, num)
    puts "#{name} line:#{num + 1} 'No space required between navigation operator'" if line.match(/\ &.|&.\ /)
  end

  def self.space_between_elements(name, line, num)
    if line.match(/\[\w|\w\]/)
      puts "#{name} line:#{num + 1} 'Space required between open/close keys and first/last element'"
    end
    puts "#{name} line:#{num + 1} 'Space required between separator and array element'" if line.match(/\[.*,\w.*\]/)
  end

  def self.exponent(name, line, num)
    puts "#{name} line:#{num + 1} 'No space required between an exponent operator'" if line.match(/\ \*\*|\*\*\ /)
  end
end
