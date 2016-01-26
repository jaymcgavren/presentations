def run_process
  puts "Please wait..."
  yield
  puts "Run complete!"
end

run_process { system("date") }
run_process { system("curl www.google.com | wc") }
