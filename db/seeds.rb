# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10.times do |i|
Language.destroy_all
Booking.destroy_all
Experience.destroy_all
Guide.destroy_all
Visitor.destroy_all

  Booking.create(
    duration: 3,
    accepted:false,
    experience_id:4,
    visitor_id:7
  )

  # Categories_experiences.creates{
  #   catergory_id:i,
  #   experience_id:i
  # }

  Experience.create(
    description: "This is a place holder, lorem ip sum etc...",
    guide_id:5
    )

  guide1= Guide.create(
    first_name: "Hisayo",
    last_name: "E",
    email:"h@h.com",
    password:"123456",
    photo:"http://placekitten.com/200/300",
    rate:50,
    city:"Toronto",
    transportation: "car"
  )

  guide2= Guide.create(
    first_name: "Kexin",
    last_name: "Wu",
    email:"x@x.com",
    password:"123456",
    photo:"http://nicenicejpg.com/200/300",
    rate:70,
    city:"Beijing",
    transportation: "car"
  )

  guide3= Guide.create(
    first_name: "Kim",
    last_name: "Erin",
    email:"k@k.com",
    password:"123456",
    photo:"http://placekitten.com/200/300",
    rate:30,
    city:"Toronto",
    transportation: "car"
  )


language1 = Language.create(
lang: "Japanese"
)
language2 = Language.create(
lang: "Chinese"
)
language3 = Language.create(
lang: "Korean"
)

# guide1.languages.create!(lang: "Chinese")
# guide2.languages.create!(lang: "Korean")
# guide3.languages.create!(lang: "Japanese, lang: "")


guide1.languages << (language1)
guide2.languages << (language2)
guide3.languages << ([language1, language3])

category1 = Category.create!(
name: "Newcommer Special"
)

category2 = Category.create!(
name: "Customized Tour"
)

category3 = Category.create!(
name: "Guide Designed Tour"
)
