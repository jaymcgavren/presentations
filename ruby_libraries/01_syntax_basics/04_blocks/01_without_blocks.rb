def system_date
  puts "Please wait..."
  system("date")
  puts "Run complete!"
end

system_date

def google_page_size
  puts "Please wait..."
  system("curl www.google.com | wc")
  puts "Run complete!"
end

google_page_size
