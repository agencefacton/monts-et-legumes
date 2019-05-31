User.destroy_all
Order.destroy_all
ProductOrder.destroy_all
Product.destroy_all
Category.destroy_all
SellingRange.destroy_all
Post.destroy_all

selling_range = SellingRange.create!(
  starts_at: 3.days.ago,
  ends_at: 3.days.from_now
)

Post.create!(content: 'Hello, welcome to the wonderfull farm <3')

tiph = User.create!(
  email: 'tiphanietourniaire@hotmail.com',
  first_name: 'Tiphanie',
  last_name: 'Tourniaire',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

clement = User.create!(
  email: 'clement.roux21@gmail.com',
  first_name: 'Clément',
  last_name: 'Roux',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

margaux = User.create!(
  email: 'margo.got@hotmail.fr',
  first_name: 'Margaux',
  last_name: 'Ollagnier',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

kevin = User.create!(
  email: 'kevin.chavanne@gmail.com',
  first_name: 'Kévin',
  last_name: 'Chavanne',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

vegetables = Category.create!(name: 'Légumes frais')
cooked = Category.create!(name: 'Légumes transformés')
meat = Category.create!(name: 'Viande de boeuf')
eggs = Category.create!(name: 'Oeufs')
dairy = Category.create!(name: 'Produits laitiers')
honey = Category.create!(name: 'Miel')

carotte = Product.create!(
  name: "Carottes",
  price: 2,
  unit: "kilo",
  category: vegetables
)

aubergine = Product.create!(
  name: "Aubergines",
  price: 4.5,
  unit: "kilo",
  category: vegetables
)

choux = Product.create!(
  name: "Soupe de choux",
  price: 2.5,
  unit: "pièce",
  category: cooked
)

boeuf = Product.create!(
  name: "Boeuf",
  price: 3.5,
  unit: "pièce",
  category: meat
)

oeuf = Product.create!(
  name: "Oeufs bio",
  description: "De la ferme à côté",
  price: 4,
  unit: "sixaine",
  category: eggs
)

order = Order.create!(
  user: kevin,
  selling_range: selling_range,
  status: 1
)

ProductOrder.create!(
  quantity: 4,
  order: order,
  product: boeuf,
  item_price: 3.5 * 4
)

ProductOrder.create!(
  quantity: 2,
  order: order,
  product: choux,
  item_price: 2 * 2.5
)

ProductOrder.create!(
  quantity: 5,
  order: order,
  product: carotte,
  item_price: 5 * 4.5
)

Transaction.create!(
  user: kevin,
  amount: 42,
  add: true
)

Transaction.create!(
  user: kevin,
  amount: 10,
  add: true
)

Transaction.create!(
  user: kevin,
  amount: 30,
  add: false
)

