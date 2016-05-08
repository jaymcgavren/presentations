def system_date
  puts "Please wait..."
  system("date")
  puts "Operation complete!"
end

system_date

def wait_briefly
  puts "Please wait..."
  sleep 2
  puts "Operation complete!"
end

wait_briefly
