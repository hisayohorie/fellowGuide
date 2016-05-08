# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  Booking.create(
    duration: i,
    accepted:false,
    experience_id:i,
    visitor_id:i
  )

  # Categories_experiences.creates{
  #   catergory_id:i,
  #   experience_id:i
  # }

  Experience.create(
    date:Time.now,
    description: "This is a place holder, lorem ip sum etc...",
    guide_id:i
    )

  Guide.create(
    name: "name#{i}",
    email:"#{i}@#{i}.#{i}",
    password:"123456",
    photo:"https://robohash.org/#{i}",
    rate:5,
    city:"Toronto the Good"
  )
    Visitor.create(
      name:"name#{i}",
      email:"#{i}@#{i}.#{i}",
      password:"123456"
    )
end
