# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = 50
reviews = 300
users = 250


#create Movies  
movies.times do
    Movie.create!(
      title: Faker::Commerce.product_name, 
      director: Faker::Name.name, 
      runtime_in_minutes: Faker::Number.number(2), 
      description: Faker::Lorem.paragraph(rand(1..18)), 
      poster_image_url: "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT1RfbHA54wfANhltY5D1_iwAzRgLEJoeDicuMyLNadUWMmyFx26Q", 
      release_date: Faker::Date.forward(1000))
end



#create Users
users.times do
  new_name = Faker::Name.first_name
  new_name2 = Faker::Name.last_name

  User.create!(
    firstname: new_name, 
    lastname: new_name2,
    email: Faker::Internet.free_email(new_name), 
    is_admin: false, 
    password: "testtest",
    password_confirmation: "testtest")
end

#create Reviews
reviews.times do
    Review.create!(user_id: rand(1..users), movie_id: rand(1..movies), rating_out_of_ten: rand(1..10), text: Faker::Lorem.paragraph(rand(1..4)))
end


# #create Reviews
# reviews.times do
#   Review.create!(user:  User.find(rand(1..users)), movie:  Movie.find(rand(1..movies)), rating_out_of_ten: rand(1..10), text: Faker::Lorem.sentence(3))
# end
