# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@players = [
    { category: "Basketball", first_name: "Kobe", last_name: "Bryant", team: "Los Angeles Lakers", condition: "Fair", year: 2006 },
    { category: "Basketball", first_name: "Shaquille", last_name: "O'neal", team: "Orlando Magic", condition: "Excellent", year: 1995 },
    { category: "Basketball", first_name: "Michael", last_name: "Jordan", team: "Chicago Bulls", condition: "Fair", year: 1996},
    { category: "Basketball", first_name: "Kevin", last_name: "Durant", team: "OKC Thunder", condition: "Poor", year: 2011},
    { category: "Basketball", first_name: "LeBron", last_name: "James", team: "Miami Heat", condition: "Fair", year:  2012},
    { category: "Basketball", first_name: "Russell", last_name: "Westbrook", team: "OKC Thunder", condition: "Excellent", year: 2016},
    { category: "Basketball", first_name: "Kobe", last_name: "Bryant", team: "Los Angeles Lakers", condition: "Excellent", year: 1998 },
    { category: "Basketball", first_name: "Russell", last_name: "Westbrook", team: "OKC Thunder", condition: "Fair", year: 2014},
    { category: "Basketball", first_name: "Giannis", last_name: "Antetokounmpo", team: "Milwaukee Bucks", condition: "Excellent", year: 2011 },
    { category: "Basketball", first_name: "Michael", last_name: "Jordan", team: "Washington Wizards", condition: "Fair", year: 2002}
  
]



me = User.create(email: 'marshall.slemp@gmail.com', username: 'marshall405', first_name: 'Marshall', last_name: 'Slemp', password: '123', password_confirmation:'123')
user1 = User.create(email: 'user1@gmail.com', username: 'user1', first_name: 'user1', last_name: 'user1', password: '123', password_confirmation:'123')
user2 = User.create(email: 'user2@gmail.com', username: 'user2', first_name: 'user2', last_name: 'user2', password: '123', password_confirmation:'123')
user3 = User.create(email: 'user3@gmail.com', username: 'user3', first_name: 'user3', last_name: 'user3', password: '123', password_confirmation:'123')

# Add Cards 
# Brand New
# Like New
# Very Good
# Acceptable
# Not Specified
emmitt = me.cards.create({ title: "Emmitt Smith Rookie Card", category: "Football", first_name: "Emmitt", last_name: "Smith", team: "Dallas Cowboys", condition: "Brand New", year: 1990 })
emmitt.card_image.attach(io: File.open( Rails.root.join('images', 'smith1990.jpg')), filename: 'smith1990.jpg', content_type: 'image/jpg') 
emmitt.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(emmitt.card_image, only_path: true)}"
emmitt.save

adrian = me.cards.create({ title: "Adrian Peterson Rookie Card, HOF", category: "Football", first_name: "Adrian", last_name: "Peterson", team: "Minnisota Vikings", condition: "Like New", year: 2007 })
adrian.card_image.attach(io: File.open( Rails.root.join('images', 'adrian2007.jpg')), filename: 'adrian2007.jpg', content_type: 'image/jpg') 
adrian.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(adrian.card_image, only_path: true)}"
adrian.save

romo = me.cards.create({ title: "Tony Romo Rookie Card, Most Humbling NFL QB of ALL TIME!", category: "Football", first_name: "Tony", last_name: "Romo", team: "Dallas Cowboys", condition: "Brand New", year: 2003 })
romo.card_image.attach(io: File.open( Rails.root.join('images', 'romo2003.jpg')), filename: 'romo2003.jpg', content_type: 'image/jpg') 
romo.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(romo.card_image, only_path: true)}"
romo.save

j1 = me.cards.create({ title: "Micheal Jordan 1988 Fleer", category: "Basketball", first_name: "Micheal", last_name: "Jordan", team: "Chicago Bulls", condition: "Like New", year: 1988 })
j1.card_image.attach(io: File.open( Rails.root.join('images', 'jordan1988.jpg')), filename: 'jordan1988.jpg', content_type: 'image/jpg') 
j1.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(j1.card_image, only_path: true)}"
j1.save



#  USER 1
jeter = user1.cards.create({ title: "Derek Jeter Yankees 2007", category: "Baseball", first_name: "Derek", last_name: "Jeter", team: "New York Yankees", condition: "Very Good", year: 2007 })
jeter.card_image.attach(io: File.open( Rails.root.join('images', 'jeter2007.jpg')), filename: 'jeter2007.jpg', content_type: 'image/jpg') 
jeter.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(jeter.card_image, only_path: true)}"
jeter.save

owens = user1.cards.create({ title: "Owens 1999 SAN FRAN ", category: "Football", first_name: "Terrell", last_name: "Owens", team: "San Francisco 49ers", condition: "Not Specified", year: 1999 })
owens.card_image.attach(io: File.open( Rails.root.join('images', 'owens1999.jpg')), filename: 'owens1999.jpg', content_type: 'image/jpg') 
owens.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(owens.card_image, only_path: true)}"
owens.save

j2 = user1.cards.create({ title: "Jordan 1992 Bulls ", category: "Basketball", first_name: "Micheal", last_name: "Jordan", team: "Chicago Bulls", condition: "Not Specified", year: 1992 })
j2.card_image.attach(io: File.open( Rails.root.join('images', 'jordan1992.jpg')), filename: 'jordan1992.jpg', content_type: 'image/jpg') 
j2.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(j2.card_image, only_path: true)}"
j2.save

# USER 2

mcnabb = user2.cards.create({ title: "Donovan McNabb Eagles - 1999", category: "Football", first_name: "Donovan", last_name: "McNabb", team: "Philidelphia Eagles", condition: "Acceptable", year: 1999 })
mcnabb.card_image.attach(io: File.open( Rails.root.join('images', 'mcnabb1999.jpg')), filename: 'mcnabb1999.jpg', content_type: 'image/jpg') 
mcnabb.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(mcnabb.card_image, only_path: true)}"
mcnabb.save

polamalu = user2.cards.create({ title: "Troy 'The Flyin Hawaiian' Polamalu", category: "Football", first_name: "Troy", last_name: "Polamalu", team: "Pittsburgh Steelers", condition: "Brand New", year: 2013 })
polamalu.card_image.attach(io: File.open( Rails.root.join('images', 'polamalu2013.jpg')), filename: 'polamalu2013.jpg', content_type: 'image/jpg') 
polamalu.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(polamalu.card_image, only_path: true)}"
polamalu.save

shaq = user2.cards.create({ title: "Superman Shaq", category: "Basketball", first_name: "Shaquille", last_name: "O'Neal", team: "Orlando Magic", condition: "Acceptable", year: 1992 })
shaq.card_image.attach(io: File.open( Rails.root.join('images', 'shaq1992.jpg')), filename: 'shaq1992.jpg', content_type: 'image/jpg') 
shaq.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(shaq.card_image, only_path: true)}"
shaq.save

# USER 3
mahomes = user3.cards.create({ title: "Super Bowl Champ - Patrick Mahomes II", category: "Football", first_name: "Patrick", last_name: "Mahomes", team: "Kansas City Chiefs", condition: "Brand New", year: 2019 })
mahomes.card_image.attach(io: File.open( Rails.root.join('images', 'mahomes2019.jpg')), filename: 'mahomes2019.jpg', content_type: 'image/jpg') 
mahomes.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(mahomes.card_image, only_path: true)}"
mahomes.save

lebron = user3.cards.create({ title: "Lebron James Rookie", category: "Basketball", first_name: "LeBron", last_name: "James", team: "Cleveland Cavaliers", condition: "Acceptable", year: 2003 })
lebron.card_image.attach(io: File.open( Rails.root.join('images', 'lebron2003.jpg')), filename: 'lebron2003.jpg', content_type: 'image/jpg') 
lebron.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(lebron.card_image, only_path: true)}"
lebron.save

westbrook = user3.cards.create({ title: "Russell Westbrook - Thunder", category: "Basketball", first_name: "Russell", last_name: "Westbrook", team: "OKC Thunder", condition: "Like New", year: 2019 })
westbrook.card_image.attach(io: File.open( Rails.root.join('images', 'westbrook2019.jpg')), filename: 'westbrook2019.jpg', content_type: 'image/jpg') 
westbrook.img_url = "http://localhost:3001#{Rails.application.routes.url_helpers.polymorphic_url(westbrook.card_image, only_path: true)}"
westbrook.save