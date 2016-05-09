require "csv"

CSV.foreach("sales.csv") do |row|
  p row
end
