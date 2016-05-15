class Invoice

  attr_accessor :subtotal, :tax_rate

  def total
    tax = subtotal * tax_rate
    subtotal + tax
  end

end

require "drb/drb"

invoice = Invoice.new
DRb.start_service("druby://localhost:8787", invoice)
DRb.thread.join
