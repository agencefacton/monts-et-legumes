# User.destroy_all

# User.create(
#   email: 'tiphanietourniaire@hotmail.com',
#   first_name: 'Tiphanie',
#   last_name: 'Tourniaire',
#   phone_number: '0000000000',
#   password: 'azerty',
#   admin: true
# )

# User.create(
#   email: 'client@fidele.com',
#   first_name: 'Client',
#   last_name: 'Fidèle',
#   phone_number: '0000000000',
#   password: 'azerty',
#   admin: false
# )

Order.create(
  year_number: 2018,
  week_number: 12,
  total_price: 20,
  user_id: 1,
  status: 1
)

Order.create(
  year_number: 2019,
  week_number: 3,
  total_price: 21.5,
  user_id: 4,
  status: 1
  )

# Product.create(
#   name: "Carottes",
#   price: 2,
#   unit: "Kilo")


# Product.create(
#   name: "Romaric le basilic",
#   price: 3,
#   unit: "Pièce")
