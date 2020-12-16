require './lib/rubo'

puts "Hi, this rubocop takes the directory 'examples' and work on all files inside on it, let's start..."
directory = Dir["./examples/**/*.rb"]

Rubo.run(directory)



# ./examples/bad.rb line 3 use single-quote in place to double-quote