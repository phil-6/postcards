# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

User.create!(
    username: "PostMaster",
    email: "postmaster@purpleriver.dev",
    description: "Hello World",
    password: "test1234"
)
User.create!(
    username: "test",
    email: "test1@email.com",
    description: "I am test",
    password: "testpass"
)
i = 1
8.times do
  i += 1
  User.create!(
      username: "test"+i.to_s ,
      email: "test"+i.to_s+"@purpleriver.dev",
      description: Faker::Movie.quote,
      password: "testpass"
  )
end

50.times do
  Postcard.create(
      user_id: Faker::Number.non_zero_digit,
      sent_to: Faker::Number.non_zero_digit,
      sent_at: Date.today,
      from_location: Faker::TvShows::TheExpanse.location,
      message: Faker::TvShows::TheExpanse.quote,
      image_link:  "https://picsum.photos/id/"+Random.rand(1000).to_s+"/640/480")
  puts("Postcard Sent!")
end