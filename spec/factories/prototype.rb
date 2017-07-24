FactoryGirl.define do

  factory :prototype do
    title                  { Faker::Pokemon.name }
    catch_copy             { Faker::Cat.name }
    concept                { Faker::Lorem.sentence }
    user
  end
end

