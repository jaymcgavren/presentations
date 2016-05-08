puts "Regular arguments..."

def receipt_item(name, price, quantity = 1)
  item_total = price * quantity
  puts "#{name} x #{quantity}: #{item_total}"
end

receipt_item("Side Table", 50.00, 2)
receipt_item("Sofa", 600.00)
receipt_item("Loveseat", 300.00)
receipt_item("Television", 900.00)

puts "-" * 30
puts "Keyword arguments..."

def receipt_item(name, price:, quantity: 1)
  item_total = price * quantity
  puts "#{name} x #{quantity}: #{item_total}"
end

receipt_item("Side Table", price: 50.00, quantity: 2)
receipt_item("Sofa", price: 600.00)
receipt_item("Loveseat", price: 300.00)
receipt_item("Television", price: 900.00)
receipt_item("Coasters", quantity: 4, price: 5.00)
