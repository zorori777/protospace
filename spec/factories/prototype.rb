FactoryGirl.define do

  factory :prototype do
    title                  { Faker::Pokemon.name }
    catch_copy             { Faker::HarryPotter.character }
    member                 { Faker::Pokemon.name }
    concept                { Faker::Lorem.sentence }
  end
end

