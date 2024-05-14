# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if User.none?
  User.create(email: "rpc@example.com", rpc: true, password: "password") 
  User.create(email: "finance@example.com", finance: true, password: "password") 
  User.create(email: "pii@example.com", pii: true, password: "password") 
end
