class Rubo
  attr_reader :errors

  def self.run(directory)
    errors = Array.new
    directory.each do |i|
      script = File.open(i)
      right_spaces(script, i)
      blank_line(script, i)
    end
  end

  private

  def self.right_spaces(script, name)
    script.each_with_index do |line, i|
      if line.match(/\ $/)
        puts "#{name} line:#{i+1} 'Right blank space(s) in the line.' "
      end
    end
  end

  def self.blank_line(script, name)
    p "yes, im entering"
    script.each_with_index do |line, i|
      if line.match(/^(\n){1}/)
        p "blank_line"
      end
    end
  end

end