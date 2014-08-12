require "awesome_print"
AwesomePrint.pry!

Pry.config.editor = proc { |file, line| "st -wn #{file}:#{line}" }
