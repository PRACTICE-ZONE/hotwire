# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

guard = Company.create!(name: "kk security")
construction = Company.create!(name: "pn solution")

# guard staff
account = User.create!(email: "accountant@kk.com", password: "123456", company: guard)
manager = User.create!(email: "manager@kk.com", password: "123456", company: guard)

# construction staff
operator = User.create!(email: "operator@pnsolution.com", password: "123456", company: construction)
engineer = User.create!(email: "engineer@pnsolution.com", password: "123456", company: construction)

quote = Quote.create!(name: "first quote", company: guard)
date = LineItemDate.create!(date: Date.current, quote:quote )
date1 = LineItemDate.create!(date: Date.current + 1.week, quote:quote)

lineItem = LineItem.create!(line_item_date: date, name: "Meeting room",
description: "A cosy meeting room for 10 people",
quantity: 1,
unit_price: 1000);
lineItem1 = LineItem.create!(line_item_date: date1, name: "cooking",
description: "A recipe of mangoes",
quantity: 1,
unit_price: 1000);
lineItem2 = LineItem.create!(line_item_date: date, name: "workout",
description: "all abs and triceps exercise",
quantity: 1,
unit_price: 1000);