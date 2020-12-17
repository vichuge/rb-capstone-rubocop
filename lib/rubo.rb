class Rubo
  attr_reader :errors

  def self.run(directory)
    errors = Array.new
    directory.each do |i|
      script = File.open(i)
      script.each_with_index do |line, j|
        right_spaces(i, line, j)
        blank_line(i, line, j)
        semicolon(i, line, j)
        nav_operator(i, line, j)
      end
    end
  end

  private

  def self.right_spaces(name, line, i)
    if line.match(/(\s){2,}$/)
      puts "#{name} line:#{i+1} 'Right blank space(s) in the line.'"
    end
  end

  def self.blank_line(name, line, i)
    if line.match(/^\n/)
      puts "#{name} line:#{i+1} 'Blank line at the start of the script'"
    end
  end

  def self.semicolon(name, line, i)
    if line.match(/;$/)
      puts "#{name} line:#{i+1} 'Semicolon is not neccesary'"
    end
  end

  def self.nav_operator(name, line, i)
    if line.match(/\ &.|&.\ /)
      puts "#{name} line:#{i+1} 'No space required between navigation operator'"
    end
  end
end