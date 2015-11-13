# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times{ User.create(
                      username: Faker::Name.first_name,
                      email: Faker::Internet.email,
                      password: Faker::Lorem.words(1),
                      bio: Faker::Lorem.paragraph,
                     )}

Genre.create(name: "Action")
Genre.create(name: "Comedy")
Genre.create(name: "Drama")
Genre.create(name: "Family")
Genre.create(name: "Horror")
Genre.create(name: "Musical")
Genre.create(name: "Noir")
Genre.create(name: "Romance")
Genre.create(name: "Science Fiction")
Genre.create(name: "Thriller")

20.times{ Review.create(
                      content: Faker::Lorem.paragraph,
                      user_id: rand(2..10),
                      movie_id: rand(1..12)
                      photography: rand(1..5),
                      directing: rand(1..5),
                      cast: rand(1..5),
                      score: rand(1..5),
                      overall_effect: rand(1..5)
                     )}
Movie.create()
