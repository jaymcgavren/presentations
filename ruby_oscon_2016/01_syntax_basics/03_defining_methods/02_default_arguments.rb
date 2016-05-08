puts "All arguments required..."

def receipt_item(name, price, quantity)
  item_total = price * quantity
  puts "#{name} x #{quantity}: #{item_total}"
end

receipt_item("Side Table", 50.00, 2)
receipt_item("Sofa", 600.00, 1)
receipt_item("Loveseat", 300.00, 1)
receipt_item("Television", 900.00, 1)

puts "-" * 30
puts "Quantity optional..."

def receipt_item(name, price, quantity = 1)
  item_total = price * quantity
  puts "#{name} x #{quantity}: #{item_total}"
end

receipt_item("Side Table", 50.00, 2)
receipt_item("Sofa", 600.00)
receipt_item("Loveseat", 300.00)
receipt_item("Television", 900.00)
