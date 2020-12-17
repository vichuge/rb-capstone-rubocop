require_relative '../lib/rubo'

puts "Hi, this rubocop takes the directory 'examples' and work on all files inside on it, let's start..."
directory = Dir['./examples/**/*.rb']
directory.each do |i|
  script = File.open(i)
  script.each_with_index do |line, j|
    print Rubo.right_spaces(i, line, j)
    print Rubo.blank_line(i, line, j)
    print Rubo.semicolon(i, line, j)
    print Rubo.nav_operator(i, line, j)
    print Rubo.space_between_elements(i, line, j)
    print Rubo.exponent(i, line, j)
  end
end
