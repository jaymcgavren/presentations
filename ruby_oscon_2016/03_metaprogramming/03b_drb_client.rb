require 'drb/drb'

DRb.start_service

remote_invoice = DRbObject.new_with_uri("druby://localhost:8787")

remote_invoice.subtotal = 100.0
remote_invoice.tax_rate = 0.10
puts remote_invoice.total
