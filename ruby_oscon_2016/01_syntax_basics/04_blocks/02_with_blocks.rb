def slow_operation
  puts "Please wait..."
  yield
  puts "Operation complete!"
end

slow_operation { system("date") }
slow_operation { sleep 2 }
