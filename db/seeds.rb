User.destroy_all

User.create(
  email: 'tiphanietourniaire@hotmail.com',
  first_name: 'Tiphanie',
  last_name: 'Tourniaire',
  phone_number: '0000000000',
  password: 'azerty',
  admin: true
)

User.create(
  email: 'client@fidele.com',
  first_name: 'Client',
  last_name: 'Fidèle',
  phone_number: '0000000000',
  password: 'azerty',
  admin: false
)

Order.create(
  week_number: 12,
  total_price: 20
  user_id: 1
)

Product.create(
  name: "Carottes",
  price: 2,
  quantity: "Kilo")


Product.create(
  name: "Romaric le basilic",
  price: 3,
  quantity: "Pièce")
