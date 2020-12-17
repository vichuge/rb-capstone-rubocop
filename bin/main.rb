require './lib/rubo'

puts "Hi, this rubocop takes the directory 'examples' and work on all files inside on it, let's start..."
directory = Dir["./examples/**/*.rb"]

Rubo.run(directory)