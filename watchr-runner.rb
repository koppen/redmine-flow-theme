if __FILE__ == $0
  puts "Run with: watchr #{__FILE__}. \n\nRequired gems: watchr rev"
  exit 1
end

# --------------------------------------------------
# Convenience Methods
# --------------------------------------------------
def run(cmd)
  puts(cmd)
  system(cmd)
end

def rebuild_stylesheets
  run "sass sass/application.sass stylesheets/application.css"
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch( '^sass/(.*)' ) { |m| rebuild_stylesheets }
watch( '^sass/(.*)/(.*)' ) { |m| rebuild_stylesheets }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  rebuild_stylesheets
end
 
# Ctrl-C
Signal.trap('INT') { abort("\n") }

rebuild_stylesheets
puts "Watching.."