require 'date'
start = Time.now
puts "Clearing database..."
Conversion.destroy_all
User.destroy_all
puts "Creating users..."
User.create!(email: "alice@example.com", password: "123456")
User.create!(email: "bob@example.com", password: "123456")
puts "Creating conversions..."
Conversion.create(from_currency: "USD", to_currency: "EUR", date: Date.today, amount: 10.00, result: 8.2, user: User.last)
Conversion.create(from_currency: "USD", to_currency: "EUR", date: Date.today, amount: 10.00, result: 8.2, user: User.last)
Conversion.create(from_currency: "USD", to_currency: "EUR", date: Date.today, amount: 10.00, result: 8.2, user: User.last)
Conversion.create(from_currency: "USD", to_currency: "EUR", date: Date.today, amount: 10.00, result: 8.2, user: User.last)
Conversion.create(from_currency: "USD", to_currency: "EUR", date: Date.today, amount: 10.00, result: 8.2, user: User.last)
finish = Time.now
diff = finish - start
puts "Done in #{diff}"

