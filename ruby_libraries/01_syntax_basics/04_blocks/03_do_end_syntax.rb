def run_process
  puts "Please wait..."
  yield
  puts "Run complete!"
end

run_process do
  system("date")
end

run_process do
  system("curl www.google.com | wc")
end
