FactoryBot.define do

  factory :user do
    username { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    description { Faker::Movies::HitchhikersGuideToTheGalaxy.quote }
    password { "password" }
    password_confirmation { "password" }
    confirmed_at { Date.today }
  end

  factory :postcard do
    user
    sent_to {1}
    sent_at { Date.today }
    from_location {Faker::TvShows::TheExpanse.location}
    message { Faker::TvShows::TheExpanse.quote }
    image_link { "https://picsum.photos/id/#{Random.rand(1000)}/640/480" }

  end

end