def slow_operation
  puts "Please wait..."
  yield
  puts "Operation complete!"
end

slow_operation do
  system("date")
end

slow_operation do
  sleep 2
end
