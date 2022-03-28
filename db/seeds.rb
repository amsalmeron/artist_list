# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
Artist.destroy_all
Painting.destroy_all

artist_1 = Artist.create!(name: "Picasso", birth_year: 1881, living: false)
artist_2 = Artist.create!(name: "Matisse", birth_year: 1869, living: false)
artist_3 = Artist.create!(name: "Beeple", birth_year: 1981, living: true)

painting_1 = Painting.create!(name: "The Old Guitarist", year_finished: 1904, abstract: false, artist_id: artist_1.id)
painting_2 = Painting.create!(name: "The Weeping Woman", year_finished: 1937, abstract: true, artist_id: artist_1.id)
painting_3 = Painting.create!(name: "Guernica", year_finished: 1937, abstract: true, artist_id: artist_1.id)
painting_4 = Painting.create!(name: "The Snail", year_finished: 1953, abstract: true, artist_id: artist_2.id)
painting_5 = Painting.create!(name: "Icarus", year_finished: 1944, abstract: true, artist_id: artist_2.id)
painting_6 = Painting.create!(name: "The First 5000 Days", year_finished: 2021, abstract: false, artist_id: artist_3.id)

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
