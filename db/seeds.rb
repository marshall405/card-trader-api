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
me.cards.create({ category: "Football", first_name: "Emmit", last_name: "Smith", team: "Dallas Cowboys", condition: "Excellent", year: 1995 })
me.cards.create({ category: "Baseball", first_name: "Derek", last_name: "Jeter", team: "New York Yankees", condition: "Fair", year: 2006 })
me.cards.create({ category: "Basketball", first_name: "Kobe", last_name: "Bryant", team: "Los Angeles Lakers", condition: "Fair", year: 1999 })
me.cards.create({ category: "Basketball", first_name: "Allen", last_name: "Iverson", team: "Philidelphia 76'rs", condition: "Fair", year: 2000 })
me.cards.create({ category: "Football", first_name: "Peyton", last_name: "Manning", team: "Indianapolis Colts", condition: "Good", year: 2010 })

def create_users
    count = 10
    n = 0
    while(n < count) do
        user = User.create(email: "test#{n}@gmail.com", username: "test#{n}", first_name: "test#{n}", last_name: "testing#{n}", password: '123', password_confirmation:'123')
        user.cards.create(@players[n])
        n += 1
    end
end

create_users


