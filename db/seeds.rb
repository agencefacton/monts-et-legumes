User.destroy_all
Order.destroy_all
Product.destroy_all

tiph = User.create!(
  email: 'tiphanietourniaire@hotmail.com',
  first_name: 'Tiphanie',
  last_name: 'Tourniaire',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

client = User.create!(
  email: 'client@fidele.com',
  first_name: 'Client',
  last_name: 'Fidèle',
  phone_number: '0000000000',
  password: 'azerty',
  admin: false
)

Product.create!(
  name: "Carottes",
  price: 2,
  unit: "kilo",
  category: "Légumes"
)

Product.create!(
  name: "Aubergines",
  price: 4.5,
  unit: "kilo",
  category: "Légumes"
)

Product.create!(
  name: "Choux",
  price: 2.5,
  unit: "pièce",
  category: "Légumes"
)

Order.create(
  year_number: 2018,
  week_number: 12,
  total_price: 20,
  user: tiph,
  status: 1
)

Order.create(
  year_number: 2019,
  week_number: 3,
  total_price: 21.5,
  user_id: client,
  status: 1
)
