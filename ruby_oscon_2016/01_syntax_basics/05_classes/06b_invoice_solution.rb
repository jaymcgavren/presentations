class Invoice
  attr_accessor :subtotal, :tax_rate

  def total
    tax = subtotal * tax_rate
    subtotal + tax
  end
end

# OR...

class Invoice
  attr_accessor :subtotal, :tax_rate

  def total
    tax = @subtotal * @tax_rate
    @subtotal + tax
  end
end

invoice = Invoice.new
invoice.subtotal = 10.00
invoice.tax_rate = 0.1
puts invoice.total # Result: 11.0
