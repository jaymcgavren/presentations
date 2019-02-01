class Invoice

  # Use attr_accessor to set up "subtotal" and "tax_rate"
  # attributes. Hint: use a :symbol for each attribute.

  def total
    # Calculate the tax by multiplying the subtotal attribute
    # by the tax_rate attribute. Then add the subtotal and
    # tax, and return that value. Remember, in Ruby, the last
    # expression evaluated is the return value!
  end

end

# When your class is complete, this code should work:
invoice = Invoice.new
invoice.subtotal = 10.00
invoice.tax_rate = 0.1
puts invoice.total # Result: 11.0
