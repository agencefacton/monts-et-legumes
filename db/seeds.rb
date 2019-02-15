User.destroy_all
Order.destroy_all
ProductOrder.destroy_all
Product.destroy_all
Category.destroy_all

tiph = User.create!(
  email: 'tiphanietourniaire@hotmail.com',
  first_name: 'Tiphanie',
  last_name: 'Tourniaire',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

client = User.create!(
  email: 'clement.roux21@gmail.com',
  first_name: 'Clément',
  last_name: 'Roux',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

client = User.create!(
  email: 'margo.got@hotmail.fr',
  first_name: 'Margaux',
  last_name: 'Ollagnier',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

vegetables = Category.create!(name: 'Légumes')
meets = Category.create!(name: 'Viande')
dairy = Category.create!(name: 'Lait / fromage')
eggs = Category.create!(name: 'Oeufs')
honey = Category.create!(name: 'Miel')

Product.create!(
  name: "Carottes",
  price: 2,
  unit: "kilo",
  category: vegetables
)

Product.create!(
  name: "Aubergines",
  price: 4.5,
  unit: "kilo",
  category: vegetables
)

Product.create!(
  name: "Choux",
  price: 2.5,
  unit: "pièce",
  category: vegetables
)



