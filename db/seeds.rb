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

Product.create!( name: 'Aubergines', price:2.9 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Ail frais', price:1 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Ail', price:1 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Basilic', price:1 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Betterave', price:2.5 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Betterave botte', price:1.8 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Betterave cuite', price:3.9 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Blette', price:2.5 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Carottes', price:2.2 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Carottes botte', price:1.8 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Céleri rave', price:2.6 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Brocoli', price:3.2 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Chou fleur', price:2.9 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Chou frisé', price:2.3 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Chou kale botte', price:1.3 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Chou rouge ', price:2.3 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Concombre', price:1 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Courge butternut', price:2.2 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Courge muscade', price:2 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Courge potimarron', price:2.2 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Courge Iron cup', price:2.2 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Courgettes', price:3 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Épinards', price:4.8 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Fenouil', price:2.6 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Fraises 250g', price:2.5 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Haricots mangetout', price:8 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Haricots verts', price:6 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Mâche', price:10 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Menthe', price:1 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Navet', price:2.2 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Navet botte', price:1.8 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Oignons botte', price:1.8 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Oignons paille', price:2.2 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Petits pois', price:6.5 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Persil', price:1 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Poireau', price:2.8 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Poivrons', price:2.7 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'PdT ferme', price:1.1 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'PdT tendre', price:1.1 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'PdT nouvelle', price:5 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'PdT rattes', price:7 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Radis', price:1.3 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Salade à l’unité', price:0.9 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Salade au poids', price:3.5 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Tomates', price:1.9 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Tomates vertes', price:0.9 ,unit: 'kilo', category: vegetables)
Product.create!( name: 'Tomates cerises', price:1.5 ,unit: 'kilo', category: vegetables)


Product.create!( name:'Chutney', price:2.5,unit:'kilo',category: cooked)
Product.create!( name:'Soupe de courgettes', price:3.5,unit:'kilo',category: cooked)
Product.create!( name:'Soupe de brocolis', price:3.5,unit:'kilo',category: cooked)
Product.create!( name:'Coulis de tomates', price:3,unit:'kilo',category: cooked)
Product.create!( name:'Soupe de courges', price:3.1,unit:'kilo',category: cooked)

