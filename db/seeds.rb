# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Repairman.create(name: 'Bud')
Repairman.create(name: 'Gus')
Repairman.create(name: 'Frank')

Customer.create(name: 'Mrs. Jones')
Customer.create(name: 'Mrs. Bingham')
Customer.create(name: 'Mrs. McNulty')


Job.create(repairman_id: 1, ticket_id: 1)
