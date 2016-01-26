require "csv"

puts format("%20s %s", "Associate", "Average Sale")
CSV.foreach("sales.csv", headers: true) do |row|
  average_value = row['Sales Total'].to_f / row['Sale Count'].to_i
  puts format("%20s $%5.2f", row["Associate"], average_value)
end
