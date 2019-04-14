# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Customer.create!(name: 'Students', is_active: true)
Customer.create!(name: 'Employees', is_active: true)

student = User.create(first_name: "test_student", last_name: "tester", email: "test_student@test.nl", password: "test", customers_id: 1)
customer_wallet_student = CustomerWallet.create(wallet_value: 50, user_id: student.id)

student.update(customer_wallet_id: customer_wallet_student.id)

employee = User.create(first_name: "test_employee", last_name: "tester", email: "test_employee@test.nl", password: "test", customers_id: 2)
customer_wallet_employee = CustomerWallet.create(wallet_value: 50, user_id: employee.id)

employee.update(customer_wallet_id: customer_wallet_employee.id)

ArtPiece.create(name: "Kunstwerk1", rentprice: 50, artist: "artiest1", length: 12, width: 10, surface: 12, built_in: 1999, image_url: "https://www.betaalbarekunst.nl/wp-content/uploads/2016/07/palet-schilderij-kleurrijke-boswandeling.jpg", belongs_to: employee.id)
ArtPiece.create(name: "Kunstwerk2", rentprice: 50, artist: "artiest2", length: 12, width: 10, surface: 12, built_in: 1999, image_url: "https://www.betaalbarekunst.nl/wp-content/uploads/2016/07/palet-schilderij-kleurrijke-boswandeling.jpg", belongs_to: employee.id)
ArtPiece.create(name: "Kunstwerk3", rentprice: 50, artist: "artiest3", length: 12, width: 10, surface: 12, built_in: 1999, image_url: "https://www.betaalbarekunst.nl/wp-content/uploads/2016/07/palet-schilderij-kleurrijke-boswandeling.jpg", belongs_to: employee.id)
