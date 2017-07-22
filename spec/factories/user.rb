FactoryGirl.define do

  password = Faker::Internet.password

  factory :user do
    name                   "takumi"
    email                  { Faker::Internet.email }
    password               password
    password_confirmation  password
    member                 { Faker::Pokemon.name }
    profile                { Faker::Lorem.sentence }
    work                   { Faker::Company.name }
    image                  { Faker::Company.logo }
  end
end
