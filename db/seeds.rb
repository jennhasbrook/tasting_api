# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
  {name: "Joe Cool", email: "joe@gmail.com", password_digest: 'password', phone_number: "505-111-2222"},
  {name: "Fancy Scmancy", email: "fancy@gmail.com", password_digest: "password", phone_number: "303-555-1122"},
  {name: "Kellie Peterbrook", email: "kellie@gmail.com", password_digest: "password", phone_number: "210-764-7777"},
  {name: "Jenn Peterbrook", email: "jenn@gmail.com", password_digest: "password", phone_number: "412-333-3636"},
  {name: "Judy Song", email: "judy@gmail.com", password_digest: "password", phone_number: "212-764-7777"},
  {name: "Beyonce Smith", email: "beyonce@gmail.com", password_digest: "password", phone_number: "412-444-3636"},
])



Winery.create({
                region: "Willamette Valley",
                subregion: "Chehalem Mountains",
                name: "Grape Valley",
                address: "467 3rd Ave, McMinnville, Oregon 97128",
                phone_number: "503-764-7777",
                tasting_fee: 25,
                varietal: "Pinot Noir, Chardonnay, Petit Verdot, Cabernet Franc",
                link: "wwww.grape.valley.com",
                description: "We are a family run winery with the best Pinots in Oregon",
                appt_needed: false,
                hours: "10am to 4pm Tuesday to Saturday",
                city: "McMinnville"
              })


Winery.create({
                region: "Southern Oregon",
                subregion: "Rogue Valley",
                name: "Grape Mountain",
                address: "4123 Main St, Corvallis, OR 97777",
                phone_number: "503-111-7777",
                tasting_fee: 20,
                varietal: "Syrah, Pinot Noir, Chardonnay, Petit Verdot, Cabernet Franc, Pinot Gris, Rose",
                link: "wwww.grape.mountain.wine",
                description: "We are a hip joint with fun wines and a cool atmosphere",
                appt_needed: true,
                hours: "12am to 4pm Thursday to Sunday",
                city: "Corvallis"
              })


Winery.create({
                region: "Columbia Gorge",
                subregion: "Columbia Gorge",
                name: "Grape Gorge",
                address: "11 Main St, Mosier, OR 98888",
                phone_number: "503-722-7777",
                tasting_fee: 15,
                varietal: "Pinot Noir, Cabernet Sauvignon, Chardonnay, Petit Syrah, Albariño",
                link: "wwww.grapegorge.com",
                description: "A boutique winery on the beautiful gorge with fabulous vistas",
                appt_needed: false,
                hours: "1pm to 4pm Wednesday through Sunday",
                city: "Mosier"
              })

Winery.create({
                region: "Willamette Valley",
                subregion: "Dundee Hills",
                name: "Grape Hill",
                address: "14729 Hwy 99W, Dundee, Oregon 97115",
                phone_number: "503-776-7777",
                tasting_fee: 40,
                varietal: "Merlot, Sangiovese, Grenache, Pinot Grigio, Malbe, Sémillion, Moscato",
                link: "wwww.grapehill.com",
                description: "Come join us in downtown Dundee for excellent non-Pinot wines and big reds",
                appt_needed: true,
                hours: "10am to 6pm Monday through Sunday",
                city: "Dundee"
              })

Winery.create({
                region: "Willamette Valley",
                subregion: "Eola-Amity Hills",
                name: "Grape Majesty",
                address: "15533 2nd St, Newberg, Oregon 97115",
                phone_number: "503-776-7777",
                tasting_fee: 20,
                varietal: "Riesling, Viognier, Sauvignon Blanc, Tempranillo, Pinot Noir",
                link: "wwww.grapemajesty.com",
                description: "We are majestic and beautiful.",
                appt_needed: true,
                hours: "10am to 5pm Monday through Sunday",
                city: "Newberg"
              })



Winery.create({
                region: "Columbia River",
                subregion: "Columbia River",
                name: "Grape Water",
                address: "14 Main St, Hood River Oregon 97112",
                phone_number: "503-776-7777",
                tasting_fee: 10,
                varietal: "Pinot Noir, Syrah, Pinot Gris, Rose, Port, Dessert Wine",
                link: "wwww.grapewater.com",
                description: "Drink our wine and get buzzed and then kayak",
                appt_needed: true,
                hours: "10am to 3pm Saturday and Sunday"
              })




Appointment.create!([
  {user_id: 1, winery_id: 1},
  {user_id: 2, winery_id: 2},
  {user_id: 3, winery_id: 3},
  {user_id: 4, winery_id: 4},
  {user_id: 5, winery_id: 5},
  {user_id: 6, winery_id: 6}, 
  {user_id: 4, winery_id: 5},
  {user_id: 5, winery_id: 6},
  {user_id: 6, winery_id: 4}
])