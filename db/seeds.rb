# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

owner_1 = Owner.create(name: "Owner 1")

machine_1 = Machine.create(location: "Denver")
machine_2 = Machine.create(location: "Broomfield")

snack_1 = Snack.create(name: "Kit-Kat", price: 1.25)
snack_2 = Snack.create(name: "Reecees", price: 1.75)
snack_3 = Snack.create(name: "Snickers", price: 1.00)

MachineSnack.create(machine: machine_1, snack: snack_1)
MachineSnack.create(machine: machine_1, snack: snack_2)
MachineSnack.create(machine: machine_2, snack: snack_2)
MachineSnack.create(machine: machine_2, snack: snack_3)
